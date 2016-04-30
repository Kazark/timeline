module Clock (currentDate) where

import Date exposing (Date, fromTime)
import Native.Clock


currentDate : () -> Date
currentDate () =
  Native.Clock.currentTime ()
    |> fromTime
