module RootComponent (..) where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (Element, widthOf, leftAligned)
import History exposing (..)
import Data exposing (timeline)
import Positioning exposing (packLayers)
import NormalMode exposing (toScroll)
import Text exposing (..)
import Set exposing (Set)
import Char exposing (KeyCode)


type ZoomLevel
  = Month
  | Year
  | Decade
  | Century

zoomOut : ZoomLevel -> ZoomLevel
zoomOut zlvl =
    case zlvl of
        Month -> Year
        Year -> Decade
        Decade -> Century
        Century -> Century

zoomIn : ZoomLevel -> ZoomLevel
zoomIn zlvl =
    case zlvl of
        Month -> Month
        Year -> Month
        Decade -> Year
        Century -> Decade


type alias Colorscheme =
  { bg : Color
  , axisLabel : Color
  , axis : Color
  , span : Color
  , spanLabel : Color
  , eventLabel : Color
  , event : Color
  }


dark : Colorscheme
dark =
  { bg = darkCharcoal
  , axisLabel = white
  , axis = lightGray
  , span = lightBlue
  , spanLabel = white
  , eventLabel = white
  , event = green
  }


light : Colorscheme
light =
  { bg = lightGray
  , axisLabel = black
  , axis = darkCharcoal
  , span = darkBlue
  , spanLabel = black
  , eventLabel = black
  , event = green
  }


type alias Model =
  { timeline : Timeline
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
  { timeline = timeline
  , centralYear = 1650
  , height = 900
  , width = 800
  , unit = 10.0
  , zoom = Year
  , scrollFactor = 10
  , colorscheme = dark
  }

convert : ZoomLevel -> ZoomLevel -> Float -> Float
convert zoomLv1 zoomLv2 x =
    case (zoomLv1, zoomLv2) of
        (Month, Year) -> x / 12
        (Month, Decade) -> convert Month Year x |> convert Year Decade
        (Month, Century) -> convert Month Decade x |> convert Decade Century
        (Year, Month) -> x * 12
        (Year, Decade) -> x / 10
        (Year, Century) -> convert Year Decade x |> convert Decade Century
        (Decade, Month) -> convert Decade Year x |> convert Year Month
        (Decade, Year) -> x * 10
        (Decade, Century) -> x / 10
        (Century, Month) -> convert Century Decade x |> convert Decade Month
        (Century, Year) -> convert Century Decade x |> convert Decade Year
        (Century, Decade) -> x * 10
        _ -> x

convertUp : ZoomLevel -> Float -> Float
convertUp zoomLv =
    convert zoomLv (zoomOut zoomLv)

convertDown : ZoomLevel -> Float -> Float
convertDown zoomLv =
    convert zoomLv (zoomIn zoomLv)

timeUnitsToYears : ZoomLevel -> Int -> Int
timeUnitsToYears zoomLv units =
    convert zoomLv Year (toFloat units)
    |> floor

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

halfAxisInYears : Model -> Int
halfAxisInYears model =
    let -- The -2 is because we don't want to draw too close to the edge when
        -- floor doesn't change the number much
        toEdge = halfScreenInTimeUnits model - 2
        toEdge' = convertUp model.zoom toEdge |> floor
        radius' = toEdge'
        radius = convertDown (zoomOut model.zoom) (toFloat radius')
    in round radius

minYear : Model -> Int
minYear model =
  model.centralYear - halfAxisInYears model


maxYear : Model -> Int
maxYear model =
  model.centralYear + halfAxisInYears model


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
      { newModel | centralYear = current.year - halfAxisInYears model }
    else if minYear newModel < 1 then
      { newModel | centralYear = 1 + halfAxisInYears model }
    else
      newModel



axisSegment : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
axisSegment colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (solid colorscheme.axis)


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
    |> drawLabel colorscheme.axisLabel xpos -15.0


drawTimeAxis : Model -> List Form
drawTimeAxis model =
  let xmax = halfScreenInPixels model
      minYearPos = (toFloat <| halfAxisInYears model) * -model.unit
      maxYearPos = -minYearPos
  in
    [ axisSegment model.colorscheme ( -xmax, 0.0 ) ( xmax, 0.0 )
    , axisSegment model.colorscheme ( minYearPos, -model.unit ) ( minYearPos, model.unit )
    , yearLabel model.colorscheme minYearPos <| minYear model
    , axisSegment model.colorscheme ( 0.0, -model.unit ) ( 0.0, model.unit )
    , yearLabel model.colorscheme 0.0 model.centralYear
    , axisSegment model.colorscheme ( maxYearPos, -model.unit ) ( maxYearPos, model.unit )
    , yearLabel model.colorscheme maxYearPos <| maxYear model
    ]


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

isOnScreen : Model -> TimeSpan -> Bool
isOnScreen model x =
    x.from.year < maxYear model && x.to.year > minYear model


drawTimeline : Model -> List Form
drawTimeline model =
  let
    timeSpanLayers =
      model.timeline.timeSpans
        |> List.filter (isOnScreen model)
        |> packLayers 0

    firstEventLayer =
      List.length timeSpanLayers

    eventLayers =
      model.timeline.events
        |> \x -> x
  in
    List.concatMap (drawTimeSpan model) timeSpanLayers
      |> List.append (List.concatMap (drawLabeledEvent model) eventLayers)


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
