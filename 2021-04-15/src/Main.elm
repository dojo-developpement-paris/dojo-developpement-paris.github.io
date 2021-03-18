module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Keyboard
import Keyboard.Arrows exposing (arrows)

type ElementType = Wall | Crate | Worker
type alias Coord = (Int, Int)

type alias Game =
    { elements : List (ElementType, Coord)
    , keysPressed : List Keyboard.Key
    }

easyGame = 
  { elements = 
    [ (Wall,   (10, 10))
    , (Wall,   (10, 11))
    , (Crate,  (9, 10))
    , (Worker, (5, 5))
    ]
  , keysPressed = []
  }

type Msg = Key Keyboard.Msg

update msg model = 
    case msg of 
      Key keyMsg -> 
        let newKeys        = Keyboard.update keyMsg model.keysPressed 
            move           = arrows newKeys
            change         = List.map moveWorker
            moveWorker elt = case elt of
              (Worker, (x,y)) -> (Worker, (x + move.x, y - move.y))
              other -> other 
        in
        ( { model | elements = change model.elements
                  , keysPressed = newKeys
          }, Cmd.none
        )

view : Game -> Html msg
view model = 
  div [] (
      model.elements
      |> List.map mkSquare
      )

colorOf eltType = case eltType of
  Wall -> "brown"
  Crate -> "transparent"
  Worker -> "transparent"

emojiOf eltType = case eltType of
  Worker -> "👷"
  Crate -> "📦"
  _ -> ""

mkSquare element = 
  let (eltType, coords) = element
  in square
      (colorOf eltType)
      coords
      (emojiOf eltType)

square color coord emoji = 
  let
      (x,y) = coord
  in span
    [ style "display" "inline-block"
    , style "position" "absolute"
    , style "font-size" "10px"
    , style "left" (String.fromInt (10*x) ++ "px")
    , style "top" (String.fromInt  (10*y) ++ "px")
    , style "width" "10px"
    , style "height" "10px"
    , style "background" color]
    [ text emoji ]

subs = 
 Sub.batch
    [Sub.map Key Keyboard.subscriptions] 
main : Program () Game Msg
main = Browser.element 
  { init = \_ -> (easyGame, Cmd.none)
  , view = view
  , update = update
  , subscriptions = \_ -> subs
  }
