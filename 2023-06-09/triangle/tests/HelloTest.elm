module HelloTest exposing (suite)

import Expect
import Test exposing (Test, describe, test)


triangle : Int -> List (List Int)
triangle _ =
    [ [ 1 ] ]


suite : Test
suite =
    describe "Triangle Pascal"
        [ test "triangle de 1 ça donne une liste de listes qui contient 1" <|
            \_ ->
                Expect.equal (triangle 1) [ [ 1 ] ]
        ]
