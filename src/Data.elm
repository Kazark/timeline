module Data (timeline) where

import History exposing (Timeline)
import Data.Events exposing (events)
import Data.People exposing (people)
import Data.Councils exposing (councils)


timeline : Timeline
timeline =
  { timeSpans = List.append people councils
  , events = events
  }
