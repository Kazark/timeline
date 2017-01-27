module TimelineCmds exposing (..)

import Query exposing (..)

type ScrollDirection = Left | Right

type ScrollDistance = Near | Far | Farthest

type TimelineCmd
  = Scroll ScrollDistance ScrollDirection 
  | RunQuery Query
  | ClearQuery
