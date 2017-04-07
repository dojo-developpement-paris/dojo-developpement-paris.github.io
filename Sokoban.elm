import Html exposing (Html,div)
import Html.Attributes exposing (..)
import String 

main =
  Html.program
    { init = init , view = view , update = update , subscriptions = subscriptions }

type alias Model = List String

init : (Model, Cmd Msg)
init = (["#######",
         "#$@. +*"], Cmd.none)

type Msg = Foo

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = ([], Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

view : Model -> Html Msg
view model = div [] <| List.map row model 

row : String -> Html Msg
row s = div [style [("display","flex")]] <| List.map cell <| String.toList s

cell : Char -> Html Msg
cell c = block <| case c of 
        '#' -> "black" 
        '$' -> "lightgreen" 
        '@' -> "lightblue"
        '.' -> "yellow"
        ' ' -> "white"
        '+' -> "blue"
        '*' -> "green"
        _ -> "red"

block : String -> Html Msg
block c = div [style [("backgroundColor", c),("height","20px"),("width", "20px") ]] []



