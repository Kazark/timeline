module NormalMode exposing (toScroll)

import KeyCodes exposing (..)
import Char exposing (KeyCode, toCode)
import Set exposing (..)

left : KeyCode -> Int
left keyCode =
  if leftArrow == keyCode || h == keyCode
  then -1
  else if Char.fromCode keyCode == 'H'
  then -10
  else if zero == keyCode || Char.fromCode keyCode == '^'
  then -1000000000 -- move to beginning
  else 0

right : KeyCode -> Int
right keyCode =
  if rightArrow == keyCode || l == keyCode
  then 1
  else if Char.fromCode keyCode == 'L'
  then 10
  else if Char.fromCode keyCode == '$'
  then 1000000000 -- move to end
  else 0

toScroll : KeyCode -> Int
toScroll keyCode =
  left keyCode + right keyCode
