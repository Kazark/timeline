module NormalMode exposing (Model, Msg, init, subscriptions, update)

import Char exposing (KeyCode, toCode)
import KeyCodes exposing (..)
import Keyboard
import MoveCmds exposing (..)
import Set exposing (..)


parseKeys : KeyCode -> Bool -> Maybe MoveCmd
parseKeys keyCode isShiftDown =
    if leftArrow == keyCode || h == keyCode then
        Just <|
            Scroll
                (if isShiftDown then
                    Far

                 else
                    Near
                )
                Left

    else if zero == keyCode || (keyCode == six && isShiftDown) then
        Just <| Scroll Farthest Left

    else if rightArrow == keyCode || l == keyCode then
        Just <|
            Scroll
                (if isShiftDown then
                    Far

                 else
                    Near
                )
                Right

    else if keyCode == four && isShiftDown then
        Just <| Scroll Farthest Right

    else
        Nothing


type Msg
    = KeyDown KeyCode
    | KeyUp KeyCode


type alias Model =
    { isShiftDown : Bool
    }


init : Model
init =
    { isShiftDown = False }


update : Msg -> Model -> ( Model, Maybe MoveCmd )
update msg model =
    case msg of
        KeyDown key ->
            if key == shift then
                ( { isShiftDown = True }, Nothing )

            else
                ( model, parseKeys key model.isShiftDown )

        KeyUp key ->
            if key == shift then
                ( { isShiftDown = False }, Nothing )

            else
                ( model, Nothing )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Keyboard.downs KeyDown
        , Keyboard.ups KeyUp
        ]
