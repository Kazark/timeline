module Lang.Tokens (..) where

type CmdPrefix = MetaCmdPrefix | DataCmdPrefix

type SelectorToken = 
    | All
    | AllInvisible
    | AllVisible

type Combinator =
    New
    | Union -- +
    | Intersection -- *
    | RelativeCompliment -- -
    | SymmetricDifference -- \
