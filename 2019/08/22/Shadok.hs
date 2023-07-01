module Shadok where

data Digit = GA | BU | ZO | MEU
    deriving (Show, Eq, Enum)

type Number = [ Digit ]

plus :: Digit -> Digit -> Digit
plus a GA = a
plus a BU = succ a
plus BU b = succ b
plus _ b  = b

plus' :: Number -> Number -> Number
plus' [ ZO ] [ ZO ]   = [ BU, GA ]
plus' [ MEU ] [ b ]   = [ b, pred b ]
plus' [ BU, a ] [ b ] = [ BU, (plus a b) ]
plus' [ a ] [ b ]     = [ plus a b ]
