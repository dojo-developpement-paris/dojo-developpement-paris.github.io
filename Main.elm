module Main exposing (main, moveLeft)

import Html
    exposing
        ( Html
        , beginnerProgram
        , button
        , div
        , table
        , td
        , text
        , tr
        )
import Html.Events exposing (onClick)
import List.Extra as List


main =
    beginnerProgram
        { model = initial
        , update = update
        , view = view
        }


type alias Model =
    List (List Int)


type Message
    = Left


initial =
    [ [ 0, 0, 0, 2 ]
    , [ 0, 0, 0, 2 ]
    , [ 0, 0, 0, 2 ]
    , [ 0, 0, 0, 2 ]
    ]


update : Message -> Model -> Model
update msg model =
    case msg of
        Left ->
            moveLeft model


moveLeft model =
    List.map moveLeftLine model


moveLeftLine line =
    List.dropWhile (\x -> x == 0) line
        |> padWithZeros


padWithZeros xs =
    xs ++ List.repeat (4 - List.length xs) 0


view : Model -> Html Message
view model =
    div []
        [ table []
            (List.map viewLine model)
        , button
            [ onClick Left ]
            [ text "Left" ]
        ]


viewLine line =
    tr [] (List.map viewCell line)


viewCell cell =
    td [] [ text (toString cell) ]
