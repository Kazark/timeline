module Clock exposing (currentDate)

import Date exposing (Date, fromTime)
import Native.Clock


currentDate : () -> Date
currentDate () =
  Native.Clock.currentTime ()
    |> fromTime
