module Main exposing (main)

import Element exposing (Element)
import Html
import Keyboard
import RootComponent
import Time exposing (Time)
import Window


main : Program Time RootComponent.Model RootComponent.Msg
main =
    Html.programWithFlags
        { init = RootComponent.init
        , view = RootComponent.view
        , update = RootComponent.update
        , subscriptions = RootComponent.subscriptions
        }
