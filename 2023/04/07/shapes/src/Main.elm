-- Make a GET request to load a book called "Public Opinion"
--
-- Read how it works:
--   https://guide.elm-lang.org/effects/http.html
--


module Main exposing (..)

import Browser
import Html exposing (Html, pre, text)
import Html.Attributes exposing (style)
import Http
import Shape exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type alias Model =
    Shape


init : () -> ( Model, Cmd Msg )
init _ =
    ( [ ( 0, 1 ), ( 1, 1 ), ( 2, 1 ), ( 2, 2 ), ( 1, 2 ), ( 0, 2 ) ]
    , Cmd.none
    )


type Msg
    = Noop


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


pointToString : Point -> String
pointToString ( x, y ) =
    String.fromInt x ++ "," ++ String.fromInt y



--     f(g(42)) === 42 |> g |> f


modelToString : Model -> String
modelToString model =
    let
        points =
            model
                |> List.map pointToString
                |> String.join " L "
    in
    "M " ++ points ++ " Z"


view : Model -> Html Msg
view model =
    svg
        [ width "100"
        , height "100"
        , viewBox "0 0 10 10"
        ]
        [ Svg.path
            [ d (modelToString model)
            , stroke "black"
            , fill "none"
            ]
            []
        ]
