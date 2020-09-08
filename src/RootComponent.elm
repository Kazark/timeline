module RootComponent exposing (Model, Msg, init, subscriptions, update, view)

import Date
import Element
import History
import Html
import NormalMode
import Time exposing (Time)
import Timeline


type alias Model =
    { timeline : Timeline.Model
    , normalMode : NormalMode.Model
    }


type Msg
    = TimelineMsg Timeline.Msg
    | NormalModeMsg NormalMode.Msg


init : Time -> ( Model, Cmd Msg )
init now =
    let
        ( timeline, cmd ) =
            Timeline.init <| History.fromDate <| Date.fromTime now
    in
    ( { timeline = timeline, normalMode = NormalMode.init }, Cmd.map TimelineMsg cmd )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Timeline.subscriptions model.timeline
            |> Sub.map TimelineMsg
        , NormalMode.subscriptions model.normalMode
            |> Sub.map NormalModeMsg
        ]


update : Msg -> Model -> ( Model, Cmd a )
update msg model =
    case msg of
        TimelineMsg msg_ ->
            let
                ( timeline, cmd ) =
                    Timeline.update msg_ model.timeline
            in
            ( { model | timeline = timeline }, cmd )

        NormalModeMsg msg_ ->
            let
                ( normalMode, maybeCmd ) =
                    NormalMode.update msg_ model.normalMode

                ( timeline, cmd ) =
                    case maybeCmd of
                        Just cmd_ ->
                            Timeline.update (Timeline.requestMove cmd_) model.timeline

                        Nothing ->
                            ( model.timeline, Cmd.none )
            in
            ( { normalMode = normalMode, timeline = timeline }, cmd )


view : Model -> Html.Html a
view model =
    Timeline.view model.timeline
        |> Element.toHtml
