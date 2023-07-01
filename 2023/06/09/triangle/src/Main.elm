module Main exposing (Model, Msg, main)

import Browser
import Hello exposing (MaybeName, hello)
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (autofocus, placeholder, value)
import Html.Events exposing (onInput)


type alias Model =
    { maybeName : MaybeName
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { maybeName = Nothing }
    , Cmd.none
    )


type Msg
    = ChangeName String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeName newName ->
            let
                newMaybeName : MaybeName
                newMaybeName =
                    case newName of
                        "" ->
                            Nothing

                        _ ->
                            Just newName
            in
            ( { model | maybeName = newMaybeName }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html Msg
view model =
    let
        nameOrEmpty : String
        nameOrEmpty =
            case model.maybeName of
                Just name ->
                    name

                Nothing ->
                    ""
    in
    div []
        [ input
            [ placeholder "Peter"
            , value nameOrEmpty
            , onInput ChangeName
            , autofocus True
            ]
            []
        , div
            []
            [ text (hello model.maybeName)
            ]
        ]


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
