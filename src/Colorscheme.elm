module Colorscheme (..) where

import Color exposing (..)

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

