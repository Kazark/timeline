module Positioning (ArrangedTimeline, arrange) where

import History exposing (..)

type alias ArrangedTimeline =
  { timeSpans : List (Int, TimeSpan)
  , events : List LabeledEvent
  }

findNext : ( Int, TimeSpan ) -> List TimeSpan -> ( List ( Int, TimeSpan ), List TimeSpan )
findNext ( layerNum, timeSpan ) timeSpans =
  case timeSpans of
    next :: rest ->
      if next.from.year > timeSpan.to.year then
        let
          ( layer, unlayered ) =
            findNext ( layerNum, next ) rest
        in
          ( ( layerNum, timeSpan ) :: layer, unlayered )
      else
        let
          ( layer, unlayered ) =
            findNext ( layerNum, timeSpan ) rest
        in
          ( layer, next :: unlayered )

    [] ->
      ( [ ( layerNum, timeSpan ) ], [] )


packLayers : Int -> List TimeSpan -> List ( Int, TimeSpan )
packLayers index timeSpans =
  case timeSpans of
    ts :: tss ->
      case findNext ( index, ts ) tss of
        ( layered, next :: rest ) ->
          packLayers (index + 1) (next :: rest)
            |> List.append layered

        ( layered, [] ) ->
          layered

    [] ->
      []

arrange : Timeline -> ArrangedTimeline
arrange timeline =
    { timeSpans = packLayers 0 timeline.timeSpans
    , events = timeline.events
    }

