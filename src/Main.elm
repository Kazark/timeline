module Main (..) where

import RootComponent
import Html
import Window
import Graphics.Element exposing (Element)


main : Signal Element
main =
  Signal.foldp RootComponent.update RootComponent.init Window.dimensions
    |> Signal.map RootComponent.view
