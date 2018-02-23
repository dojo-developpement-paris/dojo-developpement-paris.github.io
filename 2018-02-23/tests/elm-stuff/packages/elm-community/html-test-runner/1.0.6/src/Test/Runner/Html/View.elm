module Test.Runner.Html.View exposing (..)

import Test.Runner.Exploration as Runner
import Time exposing (Time)


type alias Model =
    Maybe ( Time, Runner.Status )
