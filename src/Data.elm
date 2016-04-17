module Data (timeline) where

import Date exposing (..)
import History exposing (..)


owenBorn =
  duringYear 1616


owenDied =
  on 1683 Aug 24


johnOwen =
  { from = owenBorn, to = owenDied, label = "John Owen" }


timeline : Timeline
timeline =
  { timeSpans = [ johnOwen ]
  , events = []
  }
