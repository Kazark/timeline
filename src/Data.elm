module Data (timeline) where

import History exposing (Timeline)
import Data.Events exposing (events)
import Data.People exposing (people)


timeline : Timeline
timeline =
  { timeSpans = people
  , events = events
  }
