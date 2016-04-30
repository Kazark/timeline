module History (..) where

import Date exposing (..)
import Clock exposing (currentDate)


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
  { timeSpans : List TimeSpan
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


fromDate : Date -> Event
fromDate date =
  { year = year date, month = Just <| month date, day = Just <| day date }


current =
  currentDate () |> fromDate
