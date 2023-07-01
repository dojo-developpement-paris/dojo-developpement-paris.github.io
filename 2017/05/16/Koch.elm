import Html exposing (beginnerProgram)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html.Attributes exposing (attribute)
import Tuple exposing (..)

main =
  beginnerProgram
      { model = init
      , view = view
      , update = update
      }

init : Model
init = [Forward]

type Command = Forward
type alias Model = List Command
type Msg = Nope

update : Msg -> Model -> Model
update msg model =
  case msg of
    Nope ->
      model

view : Model -> Html.Html Msg
view model =
  svg
    [ width "500", height "500", viewBox "0 0 10 10" ]
    [ polyline [ attribute "vector-effect" "non-scaling-stroke", fill "none", stroke "black", strokeWidth "1", points (turtle (0, 5) model) ] [] ]

turtle : (Int, Int) -> Model -> String
turtle (x, y) model =
  case model of
    [] -> format (x,y)
    _  -> format (x, y) ++ " " ++ turtle (x + 1, y) (List.drop 1 model)

format (x, y) = (toString x) ++ "," ++ (toString y)
