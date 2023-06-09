module HelloTest exposing (suite)

import Expect
import Test exposing (Test, describe, test)


triangle : Int -> List (List Int)
triangle n =
    case n of
        1 ->
            [ [ 1 ] ]

        2 ->
            triangle 1 ++ [ [ 1, 1 ] ]

        _ ->
            triangle 2 ++ [ triangle_ [ 1, 1 ] ]


triangle_ : List Int -> List Int
triangle_ previous =
    List.map2 (+) (0 :: previous) (previous ++ [ 0 ])


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
        ]