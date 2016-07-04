module Data.Events (events) where

import Date exposing (..)
import History exposing (..)

events : List Event
events =
  [ event (occurred <| duringMonth 313 Feb         ) "Edict of Milan"
  , event (occurred <| duringMonth 1572 Aug        ) "St. Bartholomew's Day massacre"
  , event (occurred <| on          1662 May 19     ) "Act of Uniformity"
  , event (occurred <| on          1689 May 24     ) "Act of Toleration"
  ]
