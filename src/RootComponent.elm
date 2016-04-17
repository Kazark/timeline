module RootComponent (..) where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (Element)
import History exposing (..)
import Data exposing (timeline)
import Text exposing (..)


type ZoomLevel
  = Month
  | Year
  | Decade


type alias Colorscheme =
  { bg : Color
  , axisLabel : Color
  , axis : Color
  , span : Color
  , spanLabel : Color
  }


dark : Colorscheme
dark =
  { bg = darkCharcoal
  , axisLabel = white
  , axis = lightGray
  , span = lightBlue
  , spanLabel = white
  }


light : Colorscheme
light =
  { bg = lightGray
  , axisLabel = black
  , axis = darkCharcoal
  , span = darkBlue
  , spanLabel = black
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
  , height = 600
  , width = 800
  , unit = 10.0
  , zoom = Year
  , scrollFactor = 10
  , colorscheme = dark
  }


update : ( ( Int, Int ), { x : Int, y : Int } ) -> Model -> Model
update ( ( w, h ), { x, y } ) model =
  { model
    | width = w
    , height = h
    , centralYear = model.centralYear + x * model.scrollFactor
  }


sizeTimeUnit : ZoomLevel -> Int -> Int
sizeTimeUnit zoomLv units =
  case zoomLv of
    Month ->
      floor (toFloat units / 12.0)

    Year ->
      units

    Decade ->
      units * 10


axisSegment : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
axisSegment colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (solid colorscheme.axis)


spanLabel : Colorscheme -> Float -> Float -> String -> Form
spanLabel colorscheme xpos ypos label =
  fromString label
    |> style { defaultStyle | color = colorscheme.spanLabel }
    |> text
    |> move ( xpos, ypos )


yearLabel : Colorscheme -> Float -> Int -> Form
yearLabel colorscheme xpos yr =
  toString yr
    |> fromString
    |> style { defaultStyle | color = colorscheme.axisLabel }
    |> text
    |> move ( xpos, -15.0 )


halfAxis : Model -> Float
halfAxis model =
  ((toFloat model.width) / 2.0) - (model.unit * 1.5)


timeUnits : Model -> Int
timeUnits model =
  halfAxis model
    / model.unit
    |> floor
    |> sizeTimeUnit model.zoom


drawTimeAxis : Model -> List Form
drawTimeAxis model =
  let
    halfAxis' =
      halfAxis model

    timeUnits' =
      timeUnits model

    minYear =
      model.centralYear - timeUnits'

    maxYear =
      model.centralYear + timeUnits'

    minYearPos =
      toFloat timeUnits' * -model.unit

    maxYearPos =
      toFloat timeUnits' * model.unit
  in
    [ axisSegment model.colorscheme ( -halfAxis', 0.0 ) ( halfAxis', 0.0 )
    , axisSegment model.colorscheme ( minYearPos, -model.unit ) ( minYearPos, model.unit )
    , yearLabel model.colorscheme minYearPos minYear
    , axisSegment model.colorscheme ( 0.0, -model.unit ) ( 0.0, model.unit )
    , yearLabel model.colorscheme 0.0 model.centralYear
    , axisSegment model.colorscheme ( maxYearPos, -model.unit ) ( maxYearPos, model.unit )
    , yearLabel model.colorscheme maxYearPos maxYear
    ]


spanSegment : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
spanSegment colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (solid colorscheme.span)


drawTimeSpan : Model -> Int -> TimeSpan -> List Form
drawTimeSpan model index timeSpan =
  let
    begin =
      toFloat (timeSpan.from.year - model.centralYear)
        * model.unit

    end =
      toFloat (timeSpan.to.year - model.centralYear)
        * model.unit

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
      height + (model.unit * vSign)
  in
    [ spanSegment model.colorscheme ( begin, height ) ( end, height )
    , spanSegment model.colorscheme ( begin, heightPlus ) ( begin, heightMinus )
    , spanSegment model.colorscheme ( end, heightPlus ) ( end, heightMinus )
    , spanLabel model.colorscheme labelAtX labelAtY timeSpan.label
    ]


drawTimeSpans : Model -> List Form
drawTimeSpans model =
  List.indexedMap (drawTimeSpan model) model.timeline.timeSpans
    |> List.concat


background : Model -> List Form
background model =
  [ rect
      (toFloat model.width)
      (toFloat model.height)
      |> filled model.colorscheme.bg
  ]


view : Model -> Element
view model =
  [ background, drawTimeAxis, drawTimeSpans ]
    |> List.map (\f -> f model)
    |> List.concat
    |> collage model.width model.height
