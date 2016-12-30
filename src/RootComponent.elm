module RootComponent exposing (Model, Msg, update, init, view, handleSubscriptions)

import Element
import Html
import Date
import Time exposing (Time)
import Timeline
import History

type alias Model =
    { timeline : Timeline.Model
    }

type Msg
    = TimelineMsg Timeline.Msg

init : Time -> (Model, Cmd Msg)
init now =
    let (timeline, cmd) = Timeline.init <| History.fromDate <| Date.fromTime now
    in ({ timeline = timeline }, cmd TimelineMsg)

handleSubscriptions : Model -> Sub Msg
handleSubscriptions _ =
    Timeline.subscriptions TimelineMsg

update : Msg -> Model -> ( Model, Cmd a )
update msg model =
    case msg of
        TimelineMsg msg_ ->
            let (timeline, cmd) = Timeline.update msg_ model.timeline
            in ({ timeline = timeline }, cmd)

view : Model -> Html.Html a
view model =
    Timeline.view model.timeline
    |> Element.toHtml
