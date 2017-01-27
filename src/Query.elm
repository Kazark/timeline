module Query exposing (..)

import Tags exposing (..)
import Positioning exposing (ArrangedTimeline)

type Query
  = HasTag Tag

runQuery : Query -> ArrangedTimeline -> ArrangedTimeline
runQuery (HasTag tag) timeline =
    { timeline | lives = List.filter (Tuple.second >> .tags >> (List.member tag)) timeline.lives }
