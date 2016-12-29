module Main exposing (main)

import Html
import RootComponent
import Window
import Element exposing (Element)
import Keyboard
import Time exposing (Time)


main : Program Time RootComponent.Model RootComponent.Ms
main =
    Html.programWithFlags
        { init = RootComponent.init
        , view = RootComponent.view
        , update = RootComponent.update
        , subscriptions = RootComponent.handleSubscriptions
        }
