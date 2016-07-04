module Data (timeline) where

import History exposing (Timeline)
import Data.Events exposing (events)
import Data.People exposing (people)
import Data.Councils exposing (councils)

timeline : Timeline
timeline =
  { lives = List.sortBy (\x -> x.when.from.year) people
  , events = List.append events councils
             |> List.sortBy (\x -> x.when.from.year)
  }
