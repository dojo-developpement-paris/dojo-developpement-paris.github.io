module Main exposing (..)

import Expect
import Fixtures
import Random.Pcg as Random
import Test exposing (..)
import Test.Runner.Exploration as Runner exposing (Runner)
import Test.Runner.Html
import Test.Runner.Html.View as View


suite : Test
suite =
    [ test "fails when describe has no tests" <|
        \_ ->
            run Fixtures.noTests
                |> expect
                    { steps = 2
                    , passed = 0
                    , status = "Fail"
                    , failures =
                        [ ( []
                          , [ { given = Nothing
                              , message = Fixtures.noTestsDescription
                              }
                            ]
                          )
                        ]
                    }
    , test "passing one nested test" <|
        \_ ->
            run Fixtures.oneTest
                |> expect
                    { steps = 2
                    , passed = 1
                    , status = "Pass"
                    , failures = []
                    }
    , test "increments test counter" <|
        \_ ->
            run Fixtures.twoTests
                |> expect
                    { steps = 1
                    , passed = 1
                    , status = "Running"
                    , failures = []
                    }
    , test "captures failures" <|
        \_ ->
            run Fixtures.twoTests
                |> expect
                    { steps = 2
                    , passed = 1
                    , status = "Running"
                    , failures =
                        [ ( [ "both", "two" ]
                          , [ { given = Nothing
                              , message = "message"
                              }
                            ]
                          )
                        ]
                    }
    , test "doesn't show todo with failure" <|
        \_ ->
            run Fixtures.todoWithFailingTest
                |> expect
                    { steps = 3
                    , passed = 0
                    , status = "Fail"
                    , failures =
                        [ ( [ "todo then failing", "done" ]
                          , [ { given = Nothing
                              , message = "just cause"
                              }
                            ]
                          )
                        ]
                    }
    , test "shows todo with passing" <|
        \_ ->
            run Fixtures.todoWithPassingTest
                |> expect
                    { steps = 3
                    , passed = 1
                    , status = "Todo"
                    , failures =
                        [ ( [ "todo then passing" ]
                          , [ { given = Nothing
                              , message = "haven't done this yet"
                              }
                            ]
                          )
                        ]
                    }
    , test "shows only in isolation" <|
        \_ ->
            run (Fixtures.oneTest >> only)
                |> expect
                    { steps = 2
                    , passed = 1
                    , status = "Incomplete Only"
                    , failures = []
                    }
    , test "shows skip in isolation" <|
        \_ ->
            run (Fixtures.noTests >> skip)
                |> expect
                    { steps = 1
                    , passed = 0
                    , status = "Incomplete Skip"
                    , failures = []
                    }
    , test "invalid test shows custom reason" <|
        \_ ->
            Runner.fromTest 0 (Random.initialSeed -1) (describe "asdf" [])
                |> expect
                    { steps = 1
                    , passed = 0
                    , status = "Incomplete Custom"
                    , failures = []
                    }
    ]
        |> describe "Test.Runner.Exploration"


main : Test.Runner.Html.TestProgram
main =
    Test.Runner.Html.run suite



-- HELPERS


run : (() -> Test) -> Runner
run f =
    Runner.fromTest 100 (Random.initialSeed 1) (f ())


expect :
    { steps : Int
    , passed : Int
    , status : String
    , failures :
        List
            ( List String
            , List
                { given : Maybe String
                , message : String
                }
            )
    }
    -> Runner
    -> Expect.Expectation
expect final runner =
    let
        format =
            List.map (Runner.formatFailure identity identity)

        expectFinal passed failures =
            Expect.all
                [ .passed >> flip Expect.equal passed
                , .failures >> flip Expect.equal (format failures)
                ]
                final
    in
    case ( final.steps, final.status, Runner.step runner ) of
        ( 1, "Running", Runner.Running { passed, failures } ) ->
            expectFinal passed failures

        ( 1, "Fail", Runner.Fail passed failures ) ->
            expectFinal passed failures

        ( 1, "Todo", Runner.Todo passed failures ) ->
            expectFinal passed failures

        ( 1, "Pass", Runner.Pass passed ) ->
            Expect.equal passed final.passed

        ( 1, "Incomplete Skip", Runner.Incomplete passed Runner.Skip ) ->
            Expect.equal passed final.passed

        ( 1, "Incomplete Only", Runner.Incomplete passed Runner.Only ) ->
            Expect.equal passed final.passed

        ( 1, "Incomplete Custom", Runner.Incomplete passed (Runner.Custom _) ) ->
            Expect.equal passed final.passed

        ( steps, _, Runner.Running { next } ) ->
            expect { final | steps = steps - 1 } next

        _ ->
            Expect.fail <|
                "Given: "
                    ++ toString runner
                    ++ "\nExpected: "
                    ++ toString final
