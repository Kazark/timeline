module RootComponent (..) where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (Element)
import History exposing (Timeline)
import Data exposing (timeline)
import Text exposing (..)


type alias Model =
  { timeline : Timeline
  , height : Int
  , width : Int
  }


init : Model
init =
  { timeline = timeline
  , height = 600
  , width = 800
  }


update : ( Int, Int ) -> Model -> Model
update ( w, h ) model =
  { model | width = w, height = h }


type ZoomLevel
  = Month
  | Year
  | Decade


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


yearLabel : Float -> Int -> Form
yearLabel xpos yr =
  toString yr
    |> fromString
    |> text
    |> move ( xpos, -15.0 )


drawTimeAxis : Model -> List Form
drawTimeAxis model =
  let
    unit =
      10.0

    halfAxis =
      ((toFloat model.width) / 2.0) - 15.0

    halfRange =
      toFloat (model.timeline.finish - model.timeline.start)
        / 2
        |> floor

    centralYear =
      model.timeline.start + halfRange

    timeUnits =
      halfAxis
        / unit
        |> floor
        |> sizeTimeUnit Year

    minYear =
      centralYear - timeUnits

    maxYear =
      centralYear + timeUnits

    minYearPos =
      toFloat timeUnits * -unit

    maxYearPos =
      toFloat timeUnits * unit
  in
    [ axisSegment ( -halfAxis, 0.0 ) ( halfAxis, 0.0 )
    , axisSegment ( minYearPos, -unit ) ( minYearPos, unit )
    , yearLabel minYearPos minYear
    , axisSegment ( 0.0, -unit ) ( 0.0, unit )
    , yearLabel 0.0 centralYear
    , axisSegment ( maxYearPos, -unit ) ( maxYearPos, unit )
    , yearLabel maxYearPos maxYear
    ]


background : Model -> List Form
background model =
  [ rect
      (toFloat model.width)
      (toFloat model.height)
      |> filled (rgb 244 255 255)
  ]


view : Model -> Element
view model =
  [ background, drawTimeAxis ]
    |> List.map (\f -> f model)
    |> List.concat
    |> collage model.width model.height
