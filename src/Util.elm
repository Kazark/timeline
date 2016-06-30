module Util (..) where

range : Int -> Int -> List Int
range from to =
    if from >= to
    then []
    else from :: range (from + 1) to

