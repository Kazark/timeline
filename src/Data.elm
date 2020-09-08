module Data exposing (timeline)

import Data.Councils exposing (councils)
import Data.Events exposing (events)
import Data.People exposing (people)
import Data.Periods exposing (periods)
import History exposing (Timeline, Ymd)


timeline : Ymd -> Timeline
timeline now =
    { lives = List.sortBy (\x -> x.when.from.year) (people now)
    , events =
        List.concat [ events, councils, periods ]
            |> List.sortBy (\x -> x.when.from.year)
    }
