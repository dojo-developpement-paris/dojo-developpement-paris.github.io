module Bowling exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Debug

main = beginnerProgram { model = { throws = [], newThrow = "", error = False}
                       , update = update
                       , view = view
                       }

type alias Model = { throws : List Int
                    , newThrow : String
                    , error : Bool
                    }
type Msg = ChangeScore String
         | Validate

update : Msg -> Model -> Model
update msg model = 
    case msg of
    ChangeScore x -> { model | newThrow = x }
    Validate ->
        case (String.toInt model.newThrow) of 
        Ok score -> { model | newThrow = ""
                            , throws = model.throws ++ [score]
                            , error = False
                            }
        Err _ -> { model | error = True }

score throws  =
    case throws of
    [fst, snd, ball] -> if fst + snd == 10 then (10+ball*2) else 0
    _         -> List.sum throws


view model = div [] 
                 [ input [ value model.newThrow
                         , onInput ChangeScore ] []
                 , button [onClick Validate] [text (if model.error then "oww"
                                                                   else "go")]
                 , br [] []
                 , text (toString <| score model.throws)]



