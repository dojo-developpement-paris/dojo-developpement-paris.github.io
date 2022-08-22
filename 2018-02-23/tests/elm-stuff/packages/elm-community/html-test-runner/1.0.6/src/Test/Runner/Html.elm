module Test.Runner.Html exposing (TestProgram, run, runWithOptions)

{-| HTML Runner

Runs tests in a browser and reports the results in the DOM. You can bring up
one of these tests in elm-reactor to have it run and show outputs.

@docs run, runWithOptions, TestProgram

-}

import Html
import Random.Pcg as Random
import Test exposing (Test)
import Test.Runner.Html.App as App
import Test.Runner.Html.View as View
import View as View


{-| A program which will run tests and report their results.
-}
type alias TestProgram =
    Program Never App.Model App.Msg


{-| Run the test and report the results.

Fuzz tests use a default run count of 100, and an initial seed based on the
system time when the test runs begin.

-}
run : Test -> TestProgram
run =
    runWithOptions Nothing Nothing


{-| Run the test using the provided options. If `Nothing` is provided for either
`runs` or `seed`, it will fall back on the options used in [`run`](#run).
-}
runWithOptions : Maybe Int -> Maybe Random.Seed -> Test -> TestProgram
runWithOptions runs seed test =
    Html.program
        { init = App.init (Maybe.withDefault 100 runs) seed test
        , update = App.update
        , view = App.present >> View.view
        , subscriptions = \_ -> Sub.none
        }
