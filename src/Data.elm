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
  { start = 1600
  , finish = 1700
  , timeSpans = [ johnOwen ]
  , events = []
  }
