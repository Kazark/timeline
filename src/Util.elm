module Util exposing (..)


range : Int -> Int -> List Int
range from to =
    if from >= to then
        []
    else
        from :: range (from + 1) to


(|>>) : (a -> b) -> (a -> b -> c) -> a -> c
(|>>) f1 f2 x =
    f2 x (f1 x)
