module Data (timeline) where

import Date exposing (..)
import History exposing (..)


owenBorn =
  duringYear 1616


owenDied =
  on 1683 Aug 24


johnOwen =
  { from = owenBorn, to = owenDied, label = "John Owen" }


goodwinBorn =
  on 1600 Oct 5


goodwinDied =
  on 1679 Feb 23


thomasGoodwin =
  { from = goodwinBorn, to = goodwinDied, label = "Thomas Goodwin" }


perkinsBorn =
  duringYear 1558


perkinsDied =
  duringYear 1602


williamPerkins =
  { from = perkinsBorn, to = perkinsDied, label = "William Perkins" }


amesBorn =
  duringYear 1576


amesDied =
  on 1633 Nov 14


williamAmes =
  { from = amesBorn, to = amesDied, label = "William Ames" }


flavelBorn =
  duringYear 1627


flavelDied =
  duringYear 1691


johnFlavel =
  { from = flavelBorn, to = flavelDied, label = "John Flavel" }


rutherfordBorn =
  duringYear 1600


rutherfordDied =
  on 1661 Mar 29


samuelRutherford =
  { from = rutherfordBorn, to = rutherfordDied, label = "Samuel Rutherford" }


bunyanBorn =
  on 1628 Nov 30


bunyanDied =
  on 1688 Aug 31


johnBunyan =
  { from = bunyanBorn, to = bunyanDied, label = "John Bunyan" }


bostonBorn =
  on 1676 Mar 17


bostonDied =
  on 1732 May 20


thomasBoston =
  { from = bostonBorn, to = bostonDied, label = "Thomas Boston" }


watsonBorn =
  duringYear 1620


watsonDied =
  duringYear 1686


thomasWatson =
  { from = watsonBorn, to = watsonDied, label = "Thomas Watson" }


loveBorn =
  duringYear 1618


loveDied =
  on 1651 Aug 22


christopherLove =
  { from = loveBorn, to = loveDied, label = "Christopher Love" }


turretinBorn =
  on 1623 Oct 17


turretinDied =
  on 1687 Sep 28


francisTurretin =
  { from = turretinBorn, to = turretinDied, label = "Francis Turretin" }


witsiusBorn =
  on 1636 Feb 12


witsiusDied =
  on 1708 Oct 22


hermannWitsius =
  { from = witsiusBorn, to = witsiusDied, label = "Hermann Witsius" }


brainerdBorn =
  on 1718 Apr 20


brainerdDied =
  on 1747 Oct 9


davidBrainerd =
  { from = brainerdBorn, to = brainerdDied, label = "David Brainerd" }


timeline : Timeline
timeline =
  { timeSpans =
      [ johnOwen
      , thomasGoodwin
      , williamPerkins
      , williamAmes
      , johnFlavel
      , samuelRutherford
      , johnBunyan
      , thomasBoston
      , thomasWatson
      , christopherLove
      , francisTurretin
      , hermannWitsius
      , davidBrainerd
      ]
  , events = []
  }
