module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onInput)
import Browser exposing (sandbox)

type Rover = Rover Orientation (Int, Int)

type Orientation = North | East | South | West

type Turn = TurnLeft | TurnRight

type alias Model = Rover

type Message = NewInput String

update : Message -> Model -> Model
update (NewInput str) model = 
  let (Rover orientation pos) = model
  in case String.toList str |> List.reverse |> List.head of
    Just 'L' -> Rover (turn TurnLeft orientation) pos
    Just 'R' ->  Rover (turn TurnRight orientation) pos
    Just 'M' -> Rover orientation (move orientation pos)
    _ -> model

turn : Turn -> Orientation -> Orientation
turn direction orientation =
  case (direction, orientation) of
    (TurnLeft, South) -> East
    (TurnLeft, East) -> North
    (TurnLeft, North) -> West
    (TurnLeft, West) -> South
    (TurnRight, North) -> East
    (TurnRight, West) -> North
    (TurnRight, South) -> West
    (TurnRight, East) -> South

move : Orientation -> (Int, Int) -> (Int, Int)
move orientation (x, y) =
  case orientation of
    North -> (x, y + 1)
    South -> (x, y - 1)
    East -> (x + 1, y)
    West -> (x - 1, y)

view : Model -> Html Message
view (Rover orientation (x, y)) = 
  let rover = div
        [ style "transform" ("rotate("++ angle ++"deg)")
        , style "position" "absolute"
        , style "left" "0"
        , style "top" "312"
        , style "translate" 
          (    String.fromInt (x*31 + 6) ++ "px "
            ++ String.fromInt (negate (y*31) + 6) ++ "px"
          )
        ] 
        [text "🤖"]

      gridHeight = 300

      angle = case orientation of
        North ->  "0"
        East ->   "90"
        South ->  "180"
        West ->   "270"

      board = table [] 
       (List.repeat 10
         (tr [] 
           (List.repeat 10
             (td [ style "border" "1px solid black"
                 , style "width" "25px"
                 , style "height" "25px"
                 ] [text ""]) 
           )
         )
       )

  in div
    []
  [ board 
  , rover
  , input [onInput NewInput][]
  ]

main = sandbox
  { init = Rover South (5,5)
  , update = update
  , view = view
  }
