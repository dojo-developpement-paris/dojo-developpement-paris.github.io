module Lib
    where

data Command = Left | Right | Forward

data Rover = Rover Coordinates Heading
    deriving (Show,Eq)

type Coordinates = (Integer, Integer)

data Heading = North | South | East | West
    deriving (Show,Eq)

execute :: Rover -> [Command] -> Rover
execute rover commands = foldl execute1 rover commands

execute1 :: Rover -> Command -> Rover
execute1 (Rover (0,y) North) Forward = Rover (0,y+1) North




