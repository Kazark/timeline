module RootComponent (update, init, view) where

import Graphics.Collage exposing (Form, rect, filled, collage)
import Graphics.Element exposing (Element, widthOf, leftAligned)
import History exposing (current, TimeSpan, LabeledEvent)
import Data exposing (timeline)
import Positioning exposing (ArrangedTimeline, arrange)
import NormalMode exposing (toScroll)
import Set exposing (Set)
import Char exposing (KeyCode)
import Colorscheme exposing (..)
import Zoom exposing (..)
import Util exposing (range, (|>>))

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
pixelsToTimeUnits model pixels = pixels / model.unit

halfScreenInPixels : Model -> Float
halfScreenInPixels model = (toFloat model.width) / 2.0

halfScreenInTimeUnits : Model -> Float
halfScreenInTimeUnits = halfScreenInPixels |>> pixelsToTimeUnits 

halfAxisInUppedTimeUnits : Model -> Int
halfAxisInUppedTimeUnits model =
    -- The -2 is because we don't want to draw too close to the edge when
    -- floor doesn't change the number much
    halfScreenInTimeUnits model - 2
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

updateCentralYear : Model -> Set KeyCode -> Int
updateCentralYear model keysDown =
  model.centralYear + (toScroll keysDown) * model.scrollFactor

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
    else if minYear newModel < model.scrollFactor then
      { newModel | centralYear = model.scrollFactor + halfAxisInTimeUnits model }
    else
      newModel

tickOffsets : Model -> List ( Int, Float )
tickOffsets model =
    halfAxisInUppedTimeUnits model * 2 + 1
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

placeYear : Model -> Int -> Float
placeYear model year =
  toFloat (year - model.centralYear) * model.unit

vSignAndLayer : Int -> (Int, Int)
vSignAndLayer index =
    let vSign = if index % 2 == 0
                then 1
                else -1
        layer = vSign * index // 2
    in (vSign, layer)

layerHeight : Model -> Int -> Int -> Float
layerHeight model vSign layer =
    (toFloat (layer + vSign) * model.unit * 2.0) - (model.unit * 0.5)

labelHeight : Model -> Int -> Float -> Float
labelHeight model vSign height =
      if vSign == 1
      then height + model.unit
      else height - (0.6 * model.unit)

drawTimeSpan : Model -> ( Int, TimeSpan ) -> List Form
drawTimeSpan model ( index, timeSpan ) =
    let begin = placeYear model timeSpan.from.year
        end = placeYear model timeSpan.to.year
        (vSign, layer) = vSignAndLayer index
        height = layerHeight model vSign layer
        heightPlus = height + (model.unit * 0.5)
        heightMinus = height - (model.unit * 0.5)
        labelAtX =
            toFloat (timeSpan.to.year - timeSpan.from.year) / 2.0 * model.unit + begin
        labelAtY = labelHeight model vSign height
    in [ spanSegment model.colorscheme ( begin, height ) ( end, height )
       , spanSegment model.colorscheme ( begin, heightPlus ) ( begin, heightMinus )
       , spanSegment model.colorscheme ( end, heightPlus ) ( end, heightMinus )
       , spanLabel model.colorscheme labelAtX labelAtY timeSpan.label
       ]

drawLabeledEvent : Model -> (Int, LabeledEvent) -> List Form
drawLabeledEvent model (index, levent) =
    let xpos = placeYear model levent.when.year
        (vSign, layer) = vSignAndLayer index
        height = layerHeight model vSign layer
        labelAtY = labelHeight model vSign height
        label = eventLabel model.colorscheme xpos labelAtY levent.label
        labelUnderline =
            eventUnderline model.colorscheme (xpos - 50.0, height) (xpos + 50.0, height)
        dateMarker =
            eventSegment model.colorscheme (xpos, height) (xpos, 0.0)
    in [label, labelUnderline, dateMarker]

isTimeSpanOnScreen : Model -> (Int, TimeSpan) -> Bool
isTimeSpanOnScreen model (_, x) =
    x.from.year < maxYear model && x.to.year > minYear model

isEventOnScreen : Model -> (Int, LabeledEvent) -> Bool
isEventOnScreen model (_, x) =
    x.when.year < maxYear model && x.when.year > minYear model

drawTimeline : Model -> List Form
drawTimeline model =
  let timeSpanLayers = List.filter (isTimeSpanOnScreen model) model.timeline.timeSpans
      eventLayers = List.filter (isEventOnScreen model) model.timeline.events
  in (List.concatMap (drawTimeSpan model) timeSpanLayers)
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
    [background, drawTimeAxis, drawTimeline]
    |> List.map (\f -> f model)
    |> List.concat
    |> collage model.width model.height

