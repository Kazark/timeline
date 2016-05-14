module Data.Events (events) where

import Date exposing (..)
import History exposing (..)


actOfUniformity =
  { when = on 1662 May 19, label = "Act of Uniformity" }


actOfToleration =
  { when = on 1689 May 24, label = "Act of Toleration" }


events : List LabeledEvent
events =
  [ actOfUniformity
  , actOfToleration
  ]
