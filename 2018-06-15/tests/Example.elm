module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Main exposing (moveLeft)
import Test exposing (..)


suite : Test
suite =
    describe "2048"
        [ test "moveLeft 1" <|
            \_ ->
                Expect.equal
                    (moveLeft
                        [ [ 0, 0, 0, 2 ]
                        , [ 0, 0, 0, 2 ]
                        , [ 0, 0, 0, 2 ]
                        , [ 0, 0, 0, 2 ]
                        ]
                    )
                    [ [ 2, 0, 0, 0 ]
                    , [ 2, 0, 0, 0 ]
                    , [ 2, 0, 0, 0 ]
                    , [ 2, 0, 0, 0 ]
                    ]
        , test "moveLeft 2" <|
            \_ ->
                Expect.equal
                    (moveLeft
                        [ [ 0, 0, 2, 0 ]
                        , [ 0, 0, 2, 0 ]
                        , [ 0, 0, 2, 0 ]
                        , [ 0, 0, 2, 0 ]
                        ]
                    )
                    [ [ 2, 0, 0, 0 ]
                    , [ 2, 0, 0, 0 ]
                    , [ 2, 0, 0, 0 ]
                    , [ 2, 0, 0, 0 ]
                    ]
        ]
