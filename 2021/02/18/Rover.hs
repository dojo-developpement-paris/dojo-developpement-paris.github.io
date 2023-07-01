{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving #-}
module Rover (rover)
    where

rover :: String -> String
rover s = show (roverInternal s initialState) 

initialState :: RoverState
initialState = State 0 0 N

newtype Coord = Coord Int
    deriving newtype (Show,Num,Eq,Ord,Real,Integral)

instance Enum Coord where
    pred (Coord 0) = Coord 9
    pred (Coord x) = Coord (pred x)

    succ (Coord 9) = Coord 0
    succ (Coord x) = Coord (succ x) 


data RoverState = State { x :: Coord, y :: Coord, direction :: Direction }

instance Show RoverState where
    show (State x y d) = show x <> " " <> show y <> " " <> show d

roverInternal :: String -> RoverState -> RoverState
roverInternal "" st = st
roverInternal ('L':cs) st = roverInternal cs newState
    where newState = st { direction = turnLeft (direction st) }
roverInternal ('R':cs) st = roverInternal cs newState
    where newState = st { direction = turnRight (direction st) }

roverInternal ('M':cs) (State x y d) = roverInternal cs newState
    where newState = case d of
                       N -> (State x (succ y) d)
                       E -> (State (succ x) y d)
                       W -> (State (pred x) y d)
                       S -> (State x (pred y) d)


data Direction = N | E | S | W
    deriving (Enum,Show)

turnRight :: Direction -> Direction
turnRight W = N
turnRight d = succ d

turnLeft :: Direction -> Direction
turnLeft N = W
turnLeft d = pred d
