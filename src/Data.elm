module Data (timeline) where

import Date exposing (..)
import History exposing (..)


owenBorn =
  duringYear 1616


owenDied =
  on 1683 Aug 24


johnOwen =
  { from = owenBorn, to = owenDied, label = "John Owen" }


goodwinBorn =
  on 1600 Oct 5


goodwinDied =
  on 1679 Feb 23


thomasGoodwin =
  { from = goodwinBorn, to = goodwinDied, label = "Thomas Goodwin" }


timeline : Timeline
timeline =
  { timeSpans = [ johnOwen, thomasGoodwin ]
  , events = []
  }
