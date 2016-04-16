module History (..) where

import Date exposing (..)


type alias Event =
  { year : Int
  , month : Maybe Month
  , day : Maybe Int
  }


type alias LabeledEvent =
  { year : Int
  , month : Maybe Month
  , day : Maybe Int
  , label : String
  }


type alias TimeSpan =
  { from : Event
  , to : Event
  , label : String
  }


type alias Timeline =
  { start : Int
  , finish : Int
  , timeSpans : List TimeSpan
  , events : List LabeledEvent
  }


duringYear : Int -> Event
duringYear y =
  { year = y, month = Nothing, day = Nothing }


duringMonth : Int -> Month -> Event
duringMonth y m =
  { year = y, month = Just m, day = Nothing }


on : Int -> Month -> Int -> Event
on y m d =
  { year = y, month = Just m, day = Just d }
