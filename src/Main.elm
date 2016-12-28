module Main exposing (main)

import RootComponent
import Window
import Element exposing (Element)
import Keyboard


main : Signal Element
main =
  Signal.map2 (\x y -> ( x, y )) Window.dimensions Keyboard.keysDown
    |> Signal.foldp RootComponent.update RootComponent.init
    |> Signal.map RootComponent.view
