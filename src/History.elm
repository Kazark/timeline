module History (..) where

import Date exposing (..)
import Clock exposing (currentDate)

type alias Ymd =
    { year : Int
    , month : Maybe Month
    , day : Maybe Int
    }

type alias TimeSpan =
    { from : Ymd
    , to : Ymd
    }

duringYear : Int -> Ymd
duringYear y = { year = y, month = Nothing, day = Nothing }

duringMonth : Int -> Month -> Ymd
duringMonth y m = { year = y, month = Just m, day = Nothing }

on : Int -> Month -> Int -> Ymd
on y m d = { year = y, month = Just m, day = Just d }

fromDate : Date -> Ymd
fromDate date =
    { year = year date, month = Just <| month date, day = Just <| day date }

current = currentDate () |> fromDate

occurred : Ymd -> TimeSpan
occurred ymd = { from = ymd, to = ymd }

span : Ymd -> Ymd -> TimeSpan
span ymd1 ymd2 = { from = ymd1, to = ymd2 }

type alias Life =
    { when : TimeSpan
    , name : String
    }

life : Ymd -> Ymd -> String -> Life
life e1 e2 n = { when = { from = e1, to = e2 }, name = n }

type alias Event =
    { when : TimeSpan
    , description : String
    }

event : TimeSpan -> String -> Event
event ts desc = { when = ts, description = desc }

type alias Timeline =
    { lives : List Life
    , events : List Event
    }

datesOverlap : TimeSpan -> TimeSpan -> Bool
datesOverlap ts1 ts2 =
    ts1.from.year < ts2.to.year && ts1.to.year > ts2.from.year

