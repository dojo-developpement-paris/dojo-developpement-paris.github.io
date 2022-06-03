module Test.Generated.Main exposing (main)

import Dummy

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 230760290267481
        , processes = 10
        , globs =
            []
        , paths =
            [ "/Users/christophethibaut/Coding/dojo-developpement-paris.github.io/tests/Dummy.elm"
            ]
        }
        [ ( "Dummy"
          , [ Test.Runner.Node.check Dummy.dummy
            ]
          )
        ]