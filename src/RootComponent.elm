module RootComponent (..) where

import Effects exposing (Effects)
import Html exposing (..)
import Graphics.Element exposing (show)
import History exposing (Timeline)
import Data exposing (timeline)


-- MODEL


type alias Model =
  { timeline : Timeline }


init : ( Model, Effects Action )
init =
  ( { timeline = timeline }, Effects.none )



-- UPDATE


type Action
  = NoOp


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    NoOp ->
      ( model, Effects.none )



-- VIEW


view : Signal.Address Action -> Model -> Html
view address model =
  fromElement <| show "Hello, world!"
