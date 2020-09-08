module Data.Periods exposing (periods)

import Date exposing (..)
import History exposing (..)


periods : List Event
periods =
    [ event (span (on 1598 Apr 13) (duringMonth 1685 Nov)) "Edict of Nantes"
    ]
