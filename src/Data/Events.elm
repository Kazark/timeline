module Data.Events exposing (events)

import Date exposing (..)
import History exposing (..)

-- Events to add:
--
-- http://www.alliancenet.org/cambridge-declaration
--

events : List Event
events =
  [ event (occurred <| duringMonth 313 Feb         ) "Edict of Milan"
  , event (occurred <| on          1517 Oct 31     ) "95 Theses"
  , event (occurred <| duringMonth 1572 Aug        ) "St. Bartholomew's Day massacre"
  , event (occurred <| duringYear  1563            ) "Heidelberg Catechism"
  , event (occurred <| duringYear  1595            ) "Lambeth Articles"
  , event (occurred <| on          1662 May 19     ) "Act of Uniformity"
  , event (occurred <| duringYear  1662            ) "Half-Way Covenant"
  , event (occurred <| on          1689 May 24     ) "Act of Toleration"
  , event (occurred <| duringYear  1834            ) "Auchterarder case"
  , event (occurred <| on          1843 May 18     ) "Disruption of 1843"
  , event (occurred <| duringYear  1854            ) "Immaculate Conception of Mary"
  , event (occurred <| duringYear  1887            ) "Downgrade controversy"
  ]
