module NormalMode (toScroll) where

import KeyCodes exposing (..)
import Char exposing (KeyCode, toCode)
import Set exposing (..)
import Positioning exposing (ArrangedTimeline)

left : Set KeyCode -> Int
left keyCodes =
  if member leftArrow keyCodes || member h keyCodes
  then -1
  else if member zero keyCodes || (member six keyCodes && member shift keyCodes)
  then -1000000000 -- move to beginning
  else 0

right : Set KeyCode -> Int
right keyCodes =
  if member rightArrow keyCodes || member l keyCodes
  then 1
  else if member four keyCodes && member shift keyCodes
  then 1000000000 -- move to end
  else 0

toScroll : Set KeyCode -> Int
toScroll keyCodes =
  (left keyCodes + right keyCodes)
    * if member shift keyCodes
      then 10
      else 1

rebuildQuery : (ArrangedTimeline -> ArrangedTimeline) -> Set KeyCode -> (ArrangedTimeline -> ArrangedTimeline)
rebuildQuery oldQry keycodes = oldQry

