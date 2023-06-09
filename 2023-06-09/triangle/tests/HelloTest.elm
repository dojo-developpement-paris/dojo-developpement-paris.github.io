module HelloTest exposing (suite)

import Expect
import Test exposing (Test, describe, test)


triangle : Int -> List (List Int)
triangle n =
    case n of
        1 ->
            [ [ 1 ] ]

        2 ->
            triangle 1 ++ [ iterate 1 [ 1 ] ]

        3 ->
            triangle 2 ++ [ lastLine (lastLine [ 1 ]) ]

        _ ->
            triangle 3 ++ [ lastLine (lastLine (lastLine [ 1 ])) ]


lastLine : List Int -> List Int
lastLine previous =
    List.map2 (+) (0 :: previous) (previous ++ [ 0 ])


iterate : Int -> List Int -> List Int
iterate x arg =
    case x of
        1 ->
            lastLine arg

        _ ->
            lastLine arg


suite : Test
suite =
    describe "Triangle Pascal"
        [ test "triangle de 1 ça donne une liste de listes qui contient 1" <|
            \_ ->
                Expect.equal (triangle 1) [ [ 1 ] ]
        , test "triangle de 2 donne une liste de listes qui contient 1 et 1 1" <|
            \_ ->
                Expect.equal (triangle 2) [ [ 1 ], [ 1, 1 ] ]
        , test "triangle de 3 donne une liste de listes qui contient 1 et 1 1 et 1 2 1" <|
            \_ ->
                Expect.equal (triangle 3) [ [ 1 ], [ 1, 1 ], [ 1, 2, 1 ] ]
        , test "triangle de 4 donne une liste de listes qui contient 1 et 1 1 et 1 2 1 et 1 3 3 1" <|
            \_ ->
                Expect.equal (triangle 4) [ [ 1 ], [ 1, 1 ], [ 1, 2, 1 ], [ 1, 3, 3, 1 ] ]
        ]
