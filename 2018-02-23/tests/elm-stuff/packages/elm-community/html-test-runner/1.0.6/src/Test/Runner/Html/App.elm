module Test.Runner.Html.App
    exposing
        ( Model
        , Msg(..)
        , init
        , present
        , update
        )

import Expect exposing (Expectation)
import Process
import Random.Pcg as Random
import Task
import Test exposing (Test)
import Test.Runner.Exploration as Runner
import Test.Runner.Html.View as View
import Time exposing (Time)


type Model
    = NotStarted (Maybe Random.Seed) Int Test
    | Started Time Time Runner.Status


type Msg
    = Dispatch Time


dispatch : Cmd Msg
dispatch =
    Process.sleep 0
        |> Task.andThen (\_ -> Time.now)
        |> Task.perform Dispatch


start : Int -> Test -> Random.Seed -> Runner.Status
start runs test seed =
    Runner.fromTest runs seed test
        |> Runner.step


init : Int -> Maybe Random.Seed -> Test -> ( Model, Cmd Msg )
init runs maybeSeed test =
    ( NotStarted maybeSeed runs test, dispatch )


update : Msg -> Model -> ( Model, Cmd Msg )
update (Dispatch now) model =
    case model of
        NotStarted Nothing runs test ->
            ( floor now
                |> Random.initialSeed
                |> start runs test
                |> Started now now
            , dispatch
            )

        NotStarted (Just seed) runs test ->
            ( Started now now (start runs test seed)
            , dispatch
            )

        Started startTime _ (Runner.Running { next }) ->
            ( Started startTime now (Runner.step next)
            , dispatch
            )

        Started startTime _ status ->
            ( Started startTime now status
            , Cmd.none
            )


present : Model -> View.Model
present model =
    case model of
        NotStarted _ _ _ ->
            Nothing

        Started startTime now status ->
            Just ( now - startTime, status )
