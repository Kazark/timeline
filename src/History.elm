module History exposing (..)

import Tags exposing (Tag)
import Date exposing (..)

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
duringYear y =
    { year = y, month = Nothing, day = Nothing }

duringMonth : Int -> Month -> Ymd
duringMonth y m =
    { year = y, month = Just m, day = Nothing }

on : Int -> Month -> Int -> Ymd
on y m d =
    { year = y, month = Just m, day = Just d }

fromDate : Date -> Ymd
fromDate date =
    { year = year date, month = Just <| month date, day = Just <| day date }

occurred : Ymd -> TimeSpan
occurred ymd =
    { from = ymd, to = ymd }

span : Ymd -> Ymd -> TimeSpan
span ymd1 ymd2 =
    { from = ymd1, to = ymd2 }

type alias Life =
    { when : TimeSpan
    , name : String
    , tags : List Tag
    }

life : Ymd -> Ymd -> String -> List Tag -> Life
life e1 e2 n ts =
    { when = { from = e1, to = e2 }, name = n, tags = ts }

type alias Event =
    { when : TimeSpan
    , description : String
    , tags : List Tag
    }

event : TimeSpan -> String -> List Tag -> Event
event ts desc tags =
    { when = ts, description = desc, tags = tags }

type alias Timeline =
    { lives : List Life
    , events : List Event
    }

datesOverlap : TimeSpan -> TimeSpan -> Bool
datesOverlap ts1 ts2 =
    ts1.from.year < ts2.to.year && ts1.to.year > ts2.from.year
