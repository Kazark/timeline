module Timeline exposing (Model, Msg, issueCmd, update, init, view, subscriptions)

import Collage exposing (Form, rect, filled, collage)
import Element exposing (Element, widthOf, leftAligned)
import History exposing (Life, Event, TimeSpan, Ymd, fromDate)
import Data exposing (timeline)
import Positioning exposing (..)
import TimelineCmds exposing (..)
import Colorscheme exposing (..)
import Zoom exposing (..)
import Util exposing (range, (|>>))
import Window
import Task
import Query exposing (..)

type alias Model =
    { timeline : ArrangedTimeline
    , centralYear : Int
    , height : Int
    , width : Int
    , unit : Float
    , zoom : ZoomLevel
    , scrollFactor : Int
    , colorscheme : Colorscheme
    , current : Ymd
    }

type Msg
    = WindowResized Window.Size
    | CmdIssued TimelineCmd

issueCmd : TimelineCmd -> Msg
issueCmd = CmdIssued

init : Ymd -> (Model, Cmd Msg)
init current =
    ( { timeline = arrange <| timeline current
      , centralYear = 1650
      , height = 1200
      , width = 0
      , unit = 10.0
      , zoom = Year
      , scrollFactor = 10
      , colorscheme = dark
      , current = current
      }
    , Task.perform WindowResized Window.size
    )


pixelsToTimeUnits : Model -> Float -> Float
pixelsToTimeUnits model pixels =
    pixels / model.unit


halfScreenInPixels : Model -> Float
halfScreenInPixels model =
    (toFloat model.width) / 2.0


halfScreenInTimeUnits : Model -> Float
halfScreenInTimeUnits =
    halfScreenInPixels |>> pixelsToTimeUnits


halfAxisInUppedTimeUnits : Model -> Int
halfAxisInUppedTimeUnits model =
    -- The -2 is because we don't want to draw too close to the edge when
    -- floor doesn't change the number much
    halfScreenInTimeUnits model
        - 2
        |> convertUp model.zoom
        |> floor


downTimeUnits : Model -> Int -> Float
downTimeUnits model =
    toFloat >> convertDown (zoomOut model.zoom)


halfAxisInTimeUnits : Model -> Int
halfAxisInTimeUnits model =
    halfAxisInUppedTimeUnits model
        |> downTimeUnits model
        |> round

minYear : Model -> Int
minYear model =
    model.centralYear - halfAxisInTimeUnits model

maxYear : Model -> Int
maxYear model =
    model.centralYear + halfAxisInTimeUnits model

updateCentralYear : ScrollDistance -> ScrollDirection -> Model -> Model
updateCentralYear distance direction model =
    let sign = case direction of
                   Left -> -1
                   Right -> 1
        magnitude =
            case distance of
                Near -> 1
                Far -> 10
                Farthest -> 1000000 --end
        centralYear = model.centralYear + (magnitude * model.scrollFactor * sign)
    in { model | centralYear = centralYear }

applyQuery : Query -> Model -> Model
applyQuery query model =
    { model | timeline = rearrange <| runQuery query model.timeline }

clearQuery : Model -> Model
clearQuery model =
    { model | timeline = arrange <| timeline model.current }

subscriptions : Model -> Sub Msg
subscriptions _ = Window.resizes WindowResized

resizeWindow : Window.Size -> Model -> Model
resizeWindow size model = { model | width = size.width - 30, height = size.height }

adjustForOverscroll : Model -> Model
adjustForOverscroll model =
  if maxYear model > model.current.year then
    { model | centralYear = model.current.year - halfAxisInTimeUnits model }
  else if minYear model < model.scrollFactor then
    { model | centralYear = model.scrollFactor + halfAxisInTimeUnits model }
  else model

update : Msg -> Model -> ( Model, Cmd a )
update msg model =
    let updater =
        case msg of
             WindowResized size -> resizeWindow size
             CmdIssued (Scroll distance direction) -> updateCentralYear distance direction
             CmdIssued (RunQuery query) -> applyQuery query
             CmdIssued ClearQuery -> clearQuery
    in (adjustForOverscroll <| updater model, Cmd.none)


tickOffsets : Model -> List ( Int, Float )
tickOffsets model =
    halfAxisInUppedTimeUnits model
        * 2
        + 1
        |> range 0
        |> List.map
            (\x ->
                let
                    y =
                        downTimeUnits model x
                in
                    ( round y, y * model.unit )
            )


drawTick : Model -> Int -> Float -> List Form
drawTick model year xpos =
    let
        vradius =
            (toFloat model.height) / 2.0

        h =
            model.unit * 0.5
    in
        [ vLineSegment model.colorscheme ( xpos, vradius ) ( xpos, -vradius )
        , axisSegment model.colorscheme ( xpos, -h ) ( xpos, h )
        , yearLabel model.colorscheme xpos year
        ]


drawTicks : Model -> Int -> Float -> List Form
drawTicks model beginYear beginPos =
    tickOffsets model
        |> List.concatMap (\( yearOffset, posOffset ) -> drawTick model (yearOffset + beginYear) (posOffset + beginPos))


drawTimeAxis : Model -> List Form
drawTimeAxis model =
    let
        xmax =
            halfScreenInPixels model

        minYear_ =
            minYear model

        minYearPos =
            (toFloat <| halfAxisInTimeUnits model) * -model.unit
    in
        axisSegment model.colorscheme ( -xmax, 0.0 ) ( xmax, 0.0 )
            :: drawTicks model minYear_ minYearPos


placeYear : Model -> Int -> Float
placeYear model year =
    toFloat (year - model.centralYear) * model.unit


vSignAndLayer : Int -> ( Int, Int )
vSignAndLayer index =
    let
        vSign =
            if index % 2 == 0 then
                1
            else
                -1

        layer =
            vSign * index // 2
    in
        ( vSign, layer )


layerHeight : Model -> Int -> Int -> Float
layerHeight model vSign layer =
    (toFloat (layer + vSign) * model.unit * 2.0) - (model.unit * 0.5)


labelHeight : Model -> Int -> Float -> Float
labelHeight model vSign height =
    if vSign == 1 then
        height + model.unit
    else
        height - (0.6 * model.unit)


drawTimeSpan : Model -> ( Int, Life ) -> List Form
drawTimeSpan model ( index, life ) =
    let
        begin =
            placeYear model life.when.from.year

        end =
            placeYear model life.when.to.year

        ( vSign, layer ) =
            vSignAndLayer index

        height =
            layerHeight model vSign layer

        heightPlus =
            height + (model.unit * 0.5)

        heightMinus =
            height - (model.unit * 0.5)

        labelAtX =
            toFloat (life.when.to.year - life.when.from.year) / 2.0 * model.unit + begin

        labelAtY =
            labelHeight model vSign height
    in
        [ spanSegment model.colorscheme ( begin, height ) ( end, height )
        , spanSegment model.colorscheme ( begin, heightPlus ) ( begin, heightMinus )
        , spanSegment model.colorscheme ( end, heightPlus ) ( end, heightMinus )
        , spanLabel model.colorscheme labelAtX labelAtY life.name
        ]


drawLabeledEvent : Model -> ( Int, Event ) -> List Form
drawLabeledEvent model ( index, levent ) =
    let
        xposL =
            placeYear model levent.when.from.year

        xposR =
            placeYear model levent.when.to.year

        xposMiddle =
            (xposL + xposR) / 2.0

        ( vSign, layer ) =
            vSignAndLayer index

        height =
            layerHeight model vSign layer

        labelAtY =
            labelHeight model vSign height

        label =
            eventLabel model.colorscheme xposMiddle labelAtY levent.description

        wing =
            let
                diff =
                    xposR - xposL
            in
                if diff > 100.0 then
                    5.0
                else
                    (100.0 - diff) / 2.0

        labelUnderline =
            eventUnderline model.colorscheme ( xposL - wing, height ) ( xposR + wing, height )

        dateMarkerL =
            eventSegment model.colorscheme ( xposL, height ) ( xposL, 0.0 )

        dateMarkerR =
            eventSegment model.colorscheme ( xposR, height ) ( xposR, 0.0 )
    in
        [ label, labelUnderline, dateMarkerL, dateMarkerR ]


isOnScreen : Model -> TimeSpan -> Bool
isOnScreen model x =
    x.from.year < maxYear model && x.to.year > minYear model


drawTimeline : Model -> List Form
drawTimeline model =
    let
        timeSpanLayers =
            List.filter (Tuple.second >> .when >> isOnScreen model) model.timeline.lives

        eventLayers =
            List.filter (Tuple.second >> .when >> isOnScreen model) model.timeline.events
    in
        (List.concatMap (drawTimeSpan model) timeSpanLayers)
            ++ (List.concatMap (drawLabeledEvent model) eventLayers)


background : Model -> List Form
background model =
    [ rect
        (toFloat model.width)
        (toFloat model.height)
        |> filled model.colorscheme.bg
    ]


maxLayer : List ( Int, a ) -> Int
maxLayer =
    List.map Tuple.first >> List.maximum >> Maybe.withDefault 0


computeHeight : Model -> List ( Int, Life ) -> List ( Int, Event ) -> Int
computeHeight model timeSpanLayers eventLayers =
    [ maxLayer timeSpanLayers, maxLayer eventLayers ]
        |> List.map ((+) 3 >> layerHeight model 1 >> round)
        |> List.maximum
        |> Maybe.withDefault model.height


view_ : Model -> Element
view_ model =
    [ background, drawTimeAxis, drawTimeline ]
        |> List.map (\f -> f model)
        |> List.concat
        |> collage model.width model.height


view : Model -> Element
view model =
    { model | height = computeHeight model model.timeline.lives model.timeline.events }
        |> view_
