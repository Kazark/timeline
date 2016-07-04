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

isTimeSpanWithinRangeOfEvent : TimeSpan -> Event -> Bool
isTimeSpanWithinRangeOfEvent timeSpan event =
    event.year - 10 < timeSpan.to.year && timeSpan.from.year < event.year + 10

findEventLayer' : List (Int, TimeSpan) -> Event -> Int
findEventLayer' packedTimeSpans event =
    List.filter (\(_,ts) -> isTimeSpanWithinRangeOfEvent ts event) packedTimeSpans
    |> List.map (\(layer,_) -> layer)
    |> List.foldl max 0

findEventLayer : List (Int, TimeSpan) -> LabeledEvent -> (Int, LabeledEvent)
findEventLayer packedTimeSpans labeledEvent =
    (findEventLayer' packedTimeSpans labeledEvent.when + 1, labeledEvent)

packEventLayers : List LabeledEvent -> List (Int, TimeSpan) -> List (Int, LabeledEvent)
packEventLayers events packedTimeSpans =
    List.map (findEventLayer packedTimeSpans) events

arrange : Timeline -> ArrangedTimeline
arrange timeline =
    let packedTimeSpans = packTimeSpanLayers 0 timeline.timeSpans
        packedEvents = packEventLayers timeline.events packedTimeSpans
    in { timeSpans = packedTimeSpans
    , events = packedEvents
    }

