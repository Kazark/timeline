module Data.Events (events) where

import Date exposing (..)
import History exposing (..)


events : List LabeledEvent
events =
  [ { when = duringMonth 313 Feb    , label = "Edict of Milan" }
  , { when = duringYear  325        , label = "Council of Nicaea (I)" }
  , { when = duringMonth 359 Jul    , label = "Council of Ariminum" }
  , { when = duringMonth 359 Sep    , label = "Council of Seleucia" }
  , { when = duringYear  363        , label = "Council of Laodicea" }
  , { when = duringYear  381        , label = "Council of Constantinople (I)" }
  , { when = duringYear  431        , label = "Council of Ephesus" }
  , { when = duringYear  451        , label = "Council of Chalcedon" }
  , { when = duringYear  553        , label = "Council of Constantinople (II)" }
  , { when = duringYear  680        , label = "Council of Constantinople (III)" }
  , { when = duringYear  787        , label = "Council of Nicaea (II)" }
  , { when = duringYear  869        , label = "Council of Constantinople (IV)" }
  , { when = duringYear  1123       , label = "Council of Lateran (I)" }
  , { when = duringYear  1139       , label = "Council of Lateran (II)" }
  , { when = duringYear  1179       , label = "Council of Lateran (III)" }
  , { when = duringYear  1245       , label = "Council of Lyon (I)" }
  , { when = duringYear  1311       , label = "Council of Vienne" }
  , { when = duringYear  1619       , label = "Synod of Dort" }
  , { when = duringYear  1521       , label = "Diet of Worms" }
  , { when = duringMonth 1572 Aug   , label = "St. Bartholomew's Day massacre" }
  , { when = on          1662 May 19, label = "Act of Uniformity" }
  , { when = on          1689 May 24, label = "Act of Toleration" }
  ]
