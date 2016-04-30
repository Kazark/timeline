module NormalMode (toScroll) where

import KeyCodes exposing (..)
import Char exposing (KeyCode, toCode)
import Set exposing (..)


left : Set KeyCode -> Int
left keyCodes =
  if member leftArrow keyCodes || member h keyCodes then
    -1
  else
    0


right : Set KeyCode -> Int
right keyCodes =
  if member rightArrow keyCodes || member l keyCodes then
    1
  else
    0


toScroll : Set KeyCode -> Int
toScroll keyCodes =
  (left keyCodes + right keyCodes)
    * if member shift keyCodes then
        10
      else
        1
