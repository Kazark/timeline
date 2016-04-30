module Main (..) where

import RootComponent
import Html
import Window
import Graphics.Element exposing (Element)
import Keyboard


main : Signal Element
main =
  Signal.map2 (\x y -> ( x, y )) Window.dimensions Keyboard.keysDown
    |> Signal.foldp RootComponent.update RootComponent.init
    |> Signal.map RootComponent.view
