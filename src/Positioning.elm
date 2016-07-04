module Positioning (ArrangedTimeline, arrange) where

import History exposing (..)

type alias ArrangedTimeline =
  { timeSpans : List (Int, TimeSpan)
  , events : List (Int, LabeledEvent)
  }

findNextTimeSpan : ( Int, TimeSpan ) -> List TimeSpan -> ( List ( Int, TimeSpan ), List TimeSpan )
findNextTimeSpan ( layerNum, timeSpan ) timeSpans =
  case timeSpans of
    next :: rest ->
      if next.from.year > timeSpan.to.year then
        let
          ( layer, unlayered ) =
            findNextTimeSpan ( layerNum, next ) rest
        in
          ( ( layerNum, timeSpan ) :: layer, unlayered )
      else
        let
          ( layer, unlayered ) =
            findNextTimeSpan ( layerNum, timeSpan ) rest
        in
          ( layer, next :: unlayered )

    [] ->
      ( [ ( layerNum, timeSpan ) ], [] )

packTimeSpanLayers : Int -> List TimeSpan -> List (Int, TimeSpan)
packTimeSpanLayers index timeSpans =
  case timeSpans of
    ts :: tss ->
      case findNextTimeSpan ( index, ts ) tss of
        ( layered, next :: rest ) ->
          packTimeSpanLayers (index + 1) (next :: rest)
            |> List.append layered
        ( layered, [] ) -> layered
    [] -> []

findEventLayer' : List (Int, Event, Event) -> Int -> Int -> Int
findEventLayer' packedTimeSpans eventFrom eventTo =
    (List.filter (\(_,from, to) -> eventFrom < to.year && eventTo > from.year) packedTimeSpans
     |> List.map (\(layer,_,_) -> layer)
     |> List.foldr max 0) + 1

findEventLayer : LabeledEvent -> (List (Int, LabeledEvent), List (Int, Event, Event)) -> (List (Int, LabeledEvent), List (Int, Event, Event))
findEventLayer levent (events, packedTimeSpans) =
    let eventFrom = levent.when.year - 10
        eventTo = levent.when.year + 10
        layer = findEventLayer' packedTimeSpans eventFrom eventTo
    in ((layer, levent) :: events, (layer, duringYear eventFrom, duringYear eventTo) :: packedTimeSpans)

packEventLayers' : List LabeledEvent -> List (Int, Event, Event) -> List (Int, LabeledEvent)
packEventLayers' events packedTimeSpans =
    List.sortBy (\e -> e.when.year) events
    |> List.foldr findEventLayer ([], packedTimeSpans)
    |> fst

packEventLayers : List LabeledEvent -> List (Int, TimeSpan) -> List (Int, LabeledEvent)
packEventLayers events =
    List.map (\(x,ts) -> (x, ts.from, ts.to))
    >> packEventLayers' events

arrange : Timeline -> ArrangedTimeline
arrange timeline =
    let packedTimeSpans = packTimeSpanLayers 0 timeline.timeSpans
        packedEvents = packEventLayers timeline.events packedTimeSpans
    in { timeSpans = packedTimeSpans
    , events = packedEvents
    }

