module HelloTest exposing (suite)

import Expect
import Shape exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "merge"
        [ test "merges two simple shapes" <|
            \_ ->
                let
                    square1 =
                        [ ( 0, 0 ), ( 0, 1 ), ( 1, 1 ), ( 1, 0 ) ]

                    square2 =
                        [ ( 1, 0 ), ( 2, 0 ), ( 2, 1 ), ( 1, 1 ) ]

                    result =
                        [ ( 0, 0 ), ( 1, 0 ), ( 2, 0 ), ( 2, 1 ), ( 1, 1 ), ( 1, 0 ) ]
                in
                Expect.equal result (merge square1 square2)
        , skip <|
            test "merges two other simple shapes" <|
                \_ ->
                    let
                        square1 =
                            [ ( 0, 1 ), ( 0, 2 ), ( 1, 2 ), ( 1, 1 ) ]

                        square2 =
                            [ ( 1, 1 ), ( 2, 1 ), ( 2, 2 ), ( 1, 2 ) ]

                        result =
                            [ ( 0, 1 ), ( 1, 1 ), ( 2, 1 ), ( 2, 2 ), ( 1, 2 ), ( 1, 1 ) ]
                    in
                    Expect.equal result (merge square1 square2)
        ]
