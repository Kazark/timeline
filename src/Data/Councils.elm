module Data.Councils (councils) where

import Date exposing (..)
import History exposing (..)


councils : List TimeSpan
councils =
  [ { from = on 1213 Apr 19, to = on 1215 Nov 11, label = "Council of Lateran (IV)" }
  , { from = on 1272 Mar 31, to = duringYear 1274, label = "Council of Lyon (II)" }
  , { from = duringYear 1414, to = duringYear 1418, label = "Council of Constance" }
  , { from = duringYear 1431, to = duringYear 1449, label = "Council of Florence" }
  , { from = duringYear 1512, to = duringYear 1517, label = "Council of Lateran (V)" }
  , { from = duringYear 1545, to = duringYear 1563, label = "Council of Trent" }
  , { from = on 1869 Dec 8, to = on 1870 Oct 20, label = "Vatican Council (I)" }
  , { from = on 1962 Oct 11, to = on 1965 Dec 8, label = "Vatican Council (II)" }
  ]
