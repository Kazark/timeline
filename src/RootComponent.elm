module RootComponent (..) where

import Html exposing (..)
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (Element)
import History exposing (Timeline)
import Data exposing (timeline)


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


view : Model -> Element
view model =
  collage
    model.width
    model.height
    [ rect (toFloat model.width) (toFloat model.height)
        |> filled (rgb 234 258 258)
    , segment ( -5.0, 0.0 ) ( 5.0, 0.0 )
        |> traced (solid darkCharcoal)
    ]
