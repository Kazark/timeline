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


type alias Model =
  { timeline : Timeline
  , centralYear : Int
  , height : Int
  , width : Int
  , unit : Float
  , zoom : ZoomLevel
  }


init : Model
init =
  { timeline = timeline
  , centralYear = 1650
  , height = 600
  , width = 800
  , unit = 10.0
  , zoom = Year
  }


update : ( Int, Int ) -> Model -> Model
update ( w, h ) model =
  { model | width = w, height = h }


sizeTimeUnit : ZoomLevel -> Int -> Int
sizeTimeUnit zoomLv units =
  case zoomLv of
    Month ->
      floor (toFloat units / 12.0)

    Year ->
      units

    Decade ->
      units * 10


axisSegment : ( Float, Float ) -> ( Float, Float ) -> Form
axisSegment pt1 pt2 =
  segment pt1 pt2 |> traced (solid darkCharcoal)


spanLabel : Float -> Float -> String -> Form
spanLabel xpos ypos label =
  fromString label
    |> text
    |> move ( xpos, ypos )


yearLabel : Float -> Int -> Form
yearLabel xpos yr =
  toString yr
    |> fromString
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
    [ axisSegment ( -halfAxis', 0.0 ) ( halfAxis', 0.0 )
    , axisSegment ( minYearPos, -model.unit ) ( minYearPos, model.unit )
    , yearLabel minYearPos minYear
    , axisSegment ( 0.0, -model.unit ) ( 0.0, model.unit )
    , yearLabel 0.0 model.centralYear
    , axisSegment ( maxYearPos, -model.unit ) ( maxYearPos, model.unit )
    , yearLabel maxYearPos maxYear
    ]


spanSegment : ( Float, Float ) -> ( Float, Float ) -> Form
spanSegment pt1 pt2 =
  segment pt1 pt2 |> traced (solid darkBlue)


drawTimeSpan : Model -> Int -> TimeSpan -> List Form
drawTimeSpan model index timeSpan =
  let
    begin =
      toFloat (timeSpan.from.year - model.centralYear)
        * model.unit

    end =
      toFloat (timeSpan.to.year - model.centralYear)
        * model.unit

    height =
      (toFloat (index + 1) * model.unit * 2.0) - (model.unit * 0.5)

    heightPlus =
      height + (model.unit * 0.5)

    heightMinus =
      height - (model.unit * 0.5)

    labelAtX =
      toFloat (timeSpan.to.year - timeSpan.from.year) / 2.0 * model.unit + begin

    labelAtY =
      height + model.unit
  in
    [ spanSegment ( begin, height ) ( end, height )
    , spanSegment ( begin, heightPlus ) ( begin, heightMinus )
    , spanSegment ( end, heightPlus ) ( end, heightMinus )
    , spanLabel labelAtX labelAtY timeSpan.label
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
      |> filled lightGray
  ]


view : Model -> Element
view model =
  [ background, drawTimeAxis, drawTimeSpans ]
    |> List.map (\f -> f model)
    |> List.concat
    |> collage model.width model.height
