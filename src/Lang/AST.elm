module Lang.AST (..) where

type DataOp =
    Hide
    | Show
    --| SetColor Color
    --| SetBold
    --| SetItalic

type UniverseMod =
    All
    | AllInvisible
    | AllVisible

type Selector =
    HashtagSel String
    | SearchSel String
    | UniverseSel UniverseMod
    --| TypeSel Type
    --| BeforeSel Date
    --| AfterSel Date
    --| AtSel Date

type DataQ =
    Query Selector
    | Union DataQ DataQ
    | Difference DataQ DataQ

type Direction = Backward | Forward

--type ZoomDirection = In | Out

type MetaCmd =
    Goto Int
    | Go Direction Int
    --| DoZoom ZoomDirection
    --| Scale Int

type Command =
    MetaCommand MetaCmd
    | DataCommand DataOp DataQ

