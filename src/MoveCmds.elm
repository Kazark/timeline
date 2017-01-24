module MoveCmds exposing (..)

type ScrollDirection = Left | Right

type ScrollDistance = Near | Far | Farthest

type MoveCmd
  = Scroll ScrollDistance ScrollDirection 
