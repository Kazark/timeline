module Zoom exposing (..)


type ZoomLevel
    = Month
    | Year
    | Decade
    | Century


zoomOut : ZoomLevel -> ZoomLevel
zoomOut zlvl =
    case zlvl of
        Month ->
            Year

        Year ->
            Decade

        Decade ->
            Century

        Century ->
            Century


zoomIn : ZoomLevel -> ZoomLevel
zoomIn zlvl =
    case zlvl of
        Month ->
            Month

        Year ->
            Month

        Decade ->
            Year

        Century ->
            Decade


convert : ZoomLevel -> ZoomLevel -> Float -> Float
convert zoomLv1 zoomLv2 x =
    case ( zoomLv1, zoomLv2 ) of
        ( Month, Year ) ->
            x / 12

        ( Month, Decade ) ->
            convert Month Year x |> convert Year Decade

        ( Month, Century ) ->
            convert Month Decade x |> convert Decade Century

        ( Year, Month ) ->
            x * 12

        ( Year, Decade ) ->
            x / 10

        ( Year, Century ) ->
            convert Year Decade x |> convert Decade Century

        ( Decade, Month ) ->
            convert Decade Year x |> convert Year Month

        ( Decade, Year ) ->
            x * 10

        ( Decade, Century ) ->
            x / 10

        ( Century, Month ) ->
            convert Century Decade x |> convert Decade Month

        ( Century, Year ) ->
            convert Century Decade x |> convert Decade Year

        ( Century, Decade ) ->
            x * 10

        _ ->
            x


convertUp : ZoomLevel -> Float -> Float
convertUp zoomLv =
    convert zoomLv (zoomOut zoomLv)


convertDown : ZoomLevel -> Float -> Float
convertDown zoomLv =
    convert zoomLv (zoomIn zoomLv)


timeUnitsToYears : ZoomLevel -> Int -> Int
timeUnitsToYears zoomLv units =
    convert zoomLv Year (toFloat units)
        |> floor
