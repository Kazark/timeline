module Colorscheme (..) where

import Color exposing (..)
import Graphics.Collage exposing (..)
import Text exposing (..)

type alias Colorscheme =
  { bg : Color
  , axisLabel : Color
  , axis : Color
  , vline : Color
  , span : Color
  , spanLabel : Color
  , eventLabel : Color
  , event : Color
  }

dark : Colorscheme
dark =
  { bg = black
  , axisLabel = white
  , axis = lightGray
  , vline = darkCharcoal
  , span = lightBlue
  , spanLabel = white
  , eventLabel = white
  , event = green
  }

light : Colorscheme
light =
  { bg = lightGray
  , axisLabel = black
  , axis = darkCharcoal
  , vline = darkGray
  , span = darkBlue
  , spanLabel = black
  , eventLabel = black
  , event = green
  }

axisSegment : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
axisSegment colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (solid colorscheme.axis)

vLineSegment : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
vLineSegment colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (solid colorscheme.vline)

drawLabel : Color -> Float -> Float -> String -> Form
drawLabel color xpos ypos label =
  fromString label
    |> style { defaultStyle | color = color }
    |> text
    |> move ( xpos, ypos )

eventLabel : Colorscheme -> Float -> Float -> String -> Form
eventLabel colorscheme =
  drawLabel colorscheme.eventLabel

spanLabel : Colorscheme -> Float -> Float -> String -> Form
spanLabel colorscheme =
  drawLabel colorscheme.spanLabel

yearLabel : Colorscheme -> Float -> Int -> Form
yearLabel colorscheme xpos yr =
  toString yr
    |> drawLabel colorscheme.axisLabel xpos -10.0

eventSegment : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
eventSegment colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (dotted colorscheme.event)

eventUnderline : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
eventUnderline colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (dotted colorscheme.event)

spanSegment : Colorscheme -> ( Float, Float ) -> ( Float, Float ) -> Form
spanSegment colorscheme pt1 pt2 =
  segment pt1 pt2 |> traced (solid colorscheme.span)

