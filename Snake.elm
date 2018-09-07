module Snake exposing (..)

import Html exposing (Html, div, table, td, text, tr)
import Html.Attributes exposing (style)
import Keyboard exposing (downs)
import Time exposing (every, second)


type alias Snake =
    List ( Int, Int )


type Message
    = Tick
    | ChangeDirection Int


type Direction
    = East
    | West
    | North
    | South


type alias Model =
    { gridDimensions : ( Int, Int ), snake : Snake, direction : Direction }


myView : Model -> Html a
myView m =
    let
        ( x, y ) =
            m.gridDimensions
    in
    table
        [ style
            [ ( "margin-left", "50px" )
            ]
        ]
        (List.range 1 y |> List.map (makeRow m.snake x))


makeRow : Snake -> Int -> Int -> Html a
makeRow snake xMax y =
    tr [] (List.range 1 xMax |> List.map (makeCell snake y))


makeCell : Snake -> Int -> Int -> Html a
makeCell snake y x =
    if List.member ( x, y ) snake then
        td [ style [ ( "backgroundColor", "green" ), ( "width", "20px" ), ( "height", "20px" ) ] ] []
    else
        td [ style [ ( "backgroundColor", "yellow" ), ( "width", "20px" ), ( "height", "20px" ) ] ] []


update : Message -> Model -> ( Model, Cmd a )
update msg m =
    case msg of
        Tick ->
            ( { m | snake = change m.snake m.direction }, Cmd.none )

        _ ->
            ( m, Cmd.none )


change : Snake -> Direction -> Snake
change s d =
    let
        tail =
            List.reverse (List.drop 1 (List.reverse s))

        newHead =
            case List.head tail of
                Just ( x, y ) ->
                    moveTowards ( x, y ) d

                _ ->
                    ( 0, 0 )
    in
    newHead :: tail


moveTowards : ( Int, Int ) -> Direction -> ( Int, Int )
moveTowards ( x, y ) d =
    case d of
        South ->
            ( x, y + 1 )

        North ->
            ( x, y - 1 )

        East ->
            ( x + 1, y )

        West ->
            ( x - 1, y )


main =
    Html.program
        { init =
            ( { gridDimensions = ( 20, 20 )
              , snake = [ ( 1, 1 ), ( 1, 2 ) ]
              , direction = South
              }
            , Cmd.none
            )
        , update = update
        , subscriptions = \_ -> Sub.batch [ every second (\_ -> Tick), downs ChangeDirection ]
        , view = myView
        }
