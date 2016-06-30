module RootComponent (..) where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (Element, widthOf, leftAligned)
import History exposing (..)
import Data exposing (timeline)
import Positioning exposing (ArrangedTimeline, arrange)
import NormalMode exposing (toScroll)
import Text exposing (..)
import Set exposing (Set)
import Char exposing (KeyCode)
import Colorscheme exposing (..)
import Zoom exposing (..)

type alias Model =
  { timeline : ArrangedTimeline
  , centralYear : Int
  , height : Int
  , width : Int
  , unit : Float
  , zoom : ZoomLevel
  , scrollFactor : Int
  , colorscheme : Colorscheme
  }

init : Model
init =
  { timeline = arrange timeline
  , centralYear = 1650
  , height = 1000
  , width = 800
  , unit = 10.0
  , zoom = Year
  , scrollFactor = 10
  , colorscheme = dark
  }

pixelsToTimeUnits : Model -> Float -> Float
pixelsToTimeUnits model pixels =
  pixels / model.unit

halfScreenInPixels : Model -> Float
halfScreenInPixels model =
  (toFloat model.width) / 2.0

halfScreenInTimeUnits : Model -> Float
halfScreenInTimeUnits model =
  halfScreenInPixels model
    |> pixelsToTimeUnits model

halfAxisInUppedTimeUnits : Model -> Int
halfAxisInUppedTimeUnits model =
  -- The -2 is because we don't want to draw too close to the edge when
  -- floor doesn't change the number much
    halfScreenInTimeUnits model - 2
    |> convertUp model.zoom
    |> floor

downTimeUnits : Model -> Int -> Float
downTimeUnits model =
  toFloat
    >> convertDown (zoomOut model.zoom)

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


update : ( ( Int, Int ), Set KeyCode ) -> Model -> Model
update ( ( w, h ), keysDown ) model =
  let
    newModel =
      { model
        | width = w
        , height = h
        , centralYear = model.centralYear + (toScroll keysDown) * model.scrollFactor
      }
  in
    if maxYear newModel > current.year then
      { newModel | centralYear = current.year - halfAxisInTimeUnits model }
    else if minYear newModel < 1 then
      { newModel | centralYear = 1 + halfAxisInTimeUnits model }
    else
      newModel

axisSegment : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
axisSegment colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (solid colorscheme.axis)

vLineSegment : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
vLineSegment colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (solid colorscheme.vline)


drawLabel : Color -> Float -> Float -> String -> Form
drawLabel color xpos ypos label =
  fromString label
    |> style { defaultStyle | color = color }
    |> text
    |> move ( xpos, ypos )


eventLabel : Colorscheme -> Float -> Float -> String -> Form
eventLabel colorscheme =
  drawLabel colorscheme.eventLabel


spanLabel : Colorscheme -> Float -> Float -> String -> Form
spanLabel colorscheme =
  drawLabel colorscheme.spanLabel


yearLabel : Colorscheme -> Float -> Int -> Form
yearLabel colorscheme xpos yr =
  toString yr
    |> drawLabel colorscheme.axisLabel xpos -10.0

range : Int -> Int -> List Int
range from to =
    if from >= to
    then []
  else
    from :: range (from + 1) to

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
  let vradius = (toFloat model.height) / 2.0
      h = model.unit * 0.5
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
  let xmax = halfScreenInPixels model
      minYear' = minYear model
      minYearPos = (toFloat <| halfAxisInTimeUnits model) * -model.unit
  in
    axisSegment model.colorscheme ( -xmax, 0.0 ) ( xmax, 0.0 )
      :: drawTicks model minYear' minYearPos


eventSegment : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
eventSegment colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (dotted colorscheme.event)


eventUnderline : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
eventUnderline colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (dotted colorscheme.event)


spanSegment : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
spanSegment colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (solid colorscheme.span)


placeYear : Model -> Int -> Float
placeYear model year =
  toFloat (year - model.centralYear) * model.unit


drawTimeSpan : Model -> ( Int, TimeSpan ) -> List Form
drawTimeSpan model ( index, timeSpan ) =
  let
    begin =
      placeYear model timeSpan.from.year

    end =
      placeYear model timeSpan.to.year

    vSign =
      if index % 2 == 0 then
        1
      else
        -1

    layer =
      vSign * index // 2

    height =
      (toFloat (layer + (1 * vSign)) * model.unit * 2.0) - (model.unit * 0.5)

    heightPlus =
      height + (model.unit * 0.5)

    heightMinus =
      height - (model.unit * 0.5)

    labelAtX =
      toFloat (timeSpan.to.year - timeSpan.from.year) / 2.0 * model.unit + begin

    labelAtY =
      if vSign == 1 then
        height + model.unit
      else
        height - (0.6 * model.unit)
  in
    [ spanSegment model.colorscheme ( begin, height ) ( end, height )
    , spanSegment model.colorscheme ( begin, heightPlus ) ( begin, heightMinus )
    , spanSegment model.colorscheme ( end, heightPlus ) ( end, heightMinus )
    , spanLabel model.colorscheme labelAtX labelAtY timeSpan.label
    ]


drawLabeledEvent : Model -> LabeledEvent -> List Form
drawLabeledEvent model levent =
  let
    xpos =
      placeYear model levent.when.year

    label =
      eventLabel model.colorscheme xpos 250.0 levent.label

    labelUnderline =
      eventUnderline model.colorscheme ( xpos - 50.0, 240.0 ) ( xpos + 50.0, 240.0 )

    dateMarker =
      eventSegment model.colorscheme ( xpos, 240.0 ) ( xpos, 0.0 )
  in
    [ label, labelUnderline, dateMarker ]

isOnScreen : Model -> (Int, TimeSpan) -> Bool
isOnScreen model (_, x) =
  x.from.year < maxYear model && x.to.year > minYear model


drawTimeline : Model -> List Form
drawTimeline model =
  let
    timeSpanLayers =
      model.timeline.timeSpans
        |> List.filter (isOnScreen model)

    firstEventLayer =
      List.length timeSpanLayers

    eventLayers =
      model.timeline.events
        |> \x -> x
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


view : Model -> Element
view model =
  [ background, drawTimeAxis, drawTimeline ]
    |> List.map (\f -> f model)
    |> List.concat
    |> collage model.width model.height
