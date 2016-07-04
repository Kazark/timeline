module Data (timeline) where

import History exposing (Timeline)
import Data.People exposing (people)
import Data.Councils exposing (councils)

timeline : Timeline
timeline =
  { lives = List.sortBy (\x -> x.when.from.year) people
  , events = List.sortBy (\x -> x.when.from.year) councils
  }
