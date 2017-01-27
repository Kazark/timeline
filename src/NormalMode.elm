module NormalMode exposing (Msg, Model, init, update, subscriptions)

import KeyCodes exposing (..)
import Char exposing (KeyCode, toCode)
import Set exposing (..)
import Positioning exposing (ArrangedTimeline)
import Keyboard
import TimelineCmds exposing (..)
import Query exposing (..)
import Tags exposing (..)

parseKeys : KeyCode -> Bool -> Maybe TimelineCmd
parseKeys keyCode isShiftDown =
    if leftArrow == keyCode || h == keyCode
    then Just <| Scroll (if isShiftDown then Far else Near) Left
    else if zero == keyCode || (keyCode == six && isShiftDown)
    then Just <| Scroll Farthest Left
    else if rightArrow == keyCode || l == keyCode
    then Just <| Scroll (if isShiftDown then Far else Near) Right
    else if keyCode == four && isShiftDown
    then Just <| Scroll Farthest Right
    else if keyCode == f1
    then Just (RunQuery (HasTag Puritanism))
    else Nothing

type Msg
    = KeyDown KeyCode
    | KeyUp KeyCode
    
type alias Model =
    {
        isShiftDown : Bool
    }

init : Model
init = { isShiftDown = False }

update : Msg -> Model -> (Model, Maybe TimelineCmd)
update msg model =
    case msg of
        KeyDown key ->
            if key == shift
            then ({ isShiftDown = True }, Nothing)
            else (model, parseKeys key model.isShiftDown)
        KeyUp key ->
            if key == shift
            then ({ isShiftDown = False }, Nothing)
            else (model, Nothing)

subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Keyboard.downs KeyDown
        , Keyboard.ups KeyUp
        ]

