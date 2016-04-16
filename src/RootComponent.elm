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


axisSegment : ( Float, Float ) -> ( Float, Float ) -> Form
axisSegment pt1 pt2 =
  segment pt1 pt2 |> traced (solid darkCharcoal)


drawTimeAxis : Model -> List Form
drawTimeAxis model =
  let
    halfAxis =
      ((toFloat model.width) / 2.0) - 15.0

    halfRange =
      toFloat (model.timeline.finish - model.timeline.start)
        / 2
        |> floor

    centralDate =
      model.timeline.start + halfRange
  in
    [ axisSegment ( -halfAxis, 0.0 ) ( halfAxis, 0.0 )
    , axisSegment ( -halfAxis, -10.0 ) ( -halfAxis, 10.0 )
    , axisSegment ( 0.0, -10.0 ) ( 0.0, 10.0 )
    , toString centralDate
        |> fromString
        |> text
        |> move ( 0.0, -15.0 )
    , axisSegment ( halfAxis, -10.0 ) ( halfAxis, 10.0 )
    ]


background : Model -> Form
background model =
  rect
    (toFloat model.width)
    (toFloat model.height)
    |> filled (rgb 244 255 255)


view : Model -> Element
view model =
  collage
    model.width
    model.height
    (background model :: drawTimeAxis model)
