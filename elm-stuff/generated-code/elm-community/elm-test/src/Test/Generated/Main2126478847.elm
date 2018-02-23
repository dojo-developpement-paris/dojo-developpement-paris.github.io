module Test.Generated.Main2126478847 exposing (main)

import Spec

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test
import Json.Encode

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "Spec" [Spec.spec] ]
        |> Test.concat
        |> Test.Runner.Node.runWithOptions { runs = Nothing, report = (ConsoleReport UseColor), seed = Nothing, processes = 8, paths = []}