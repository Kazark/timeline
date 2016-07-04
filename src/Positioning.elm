module Positioning (ArrangedTimeline, arrange) where

import History exposing (..)

type alias ArrangedTimeline =
  { lives : List (Int, Life)
  , events : List (Int, Event)
  }

findNextLife : (Int, Life) -> List Life -> (List (Int, Life), List Life)
findNextLife (layerNum, life) lives =
    case lives of
        next :: rest ->
            if next.when.from.year > life.when.to.year
            then
                let (layer, unlayered) = findNextLife (layerNum, next) rest
                in ((layerNum, life) :: layer, unlayered)
            else
                let (layer, unlayered) = findNextLife (layerNum, life) rest
                in (layer, next :: unlayered)
        [] -> ([(layerNum, life)], [])

packLifeLayers : Int -> List Life -> List (Int, Life)
packLifeLayers index lives =
  case lives of
      ts :: tss ->
          case findNextLife (index, ts) tss of
            (layered, next :: rest) ->
                packLifeLayers (index + 1) (next :: rest)
                |> List.append layered
            (layered, []) -> layered
      [] -> []

findEventLayer' : List (Int, TimeSpan) -> TimeSpan -> Int
findEventLayer' packedLives eventWithRoom =
    (List.filter (snd >> datesOverlap eventWithRoom) packedLives
     |> List.map fst
     |> List.foldr max 0) + 1

findEventLayer : Event -> (List (Int, Event), List (Int, TimeSpan)) -> (List (Int, Event), List (Int, TimeSpan))
findEventLayer levent (events, packedLives) =
    let eventWithRoom = { from = duringYear <| levent.when.from.year - 10, to = duringYear <| levent.when.to.year + 10 }
        layer = findEventLayer' packedLives eventWithRoom
    in ((layer, levent) :: events, (layer, eventWithRoom) :: packedLives)

packEventLayers' : List Event -> List (Int, TimeSpan) -> List (Int, Event)
packEventLayers' events packedLives =
    List.foldr findEventLayer ([], packedLives) events
    |> fst

packEventLayers : List Event -> List (Int, Life) -> List (Int, Event)
packEventLayers events =
    List.map (\(x,ts) -> (x, ts.when))
    >> packEventLayers' events

arrange : Timeline -> ArrangedTimeline
arrange timeline =
    let packedLives = packLifeLayers 0 timeline.lives
        packedEvents = packEventLayers timeline.events packedLives
    in { lives = packedLives
    , events = packedEvents
    }

