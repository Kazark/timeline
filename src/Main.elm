module Main exposing (main)

import Html.App as Html
import RootComponent
import Window
import Element exposing (Element)
import Keyboard


main : Program Never
main =
    Html.program
        { init = (RootComponent.init, Cmd.none)
        , view = RootComponent.view
        , update = RootComponent.update
        , subscriptions = RootComponent.handleSubscriptions
        }
