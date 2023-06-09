module HelloTest exposing (suite)

import Expect
import Hello exposing (hello)
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Hello"
        [ test "world" <|
            \_ ->
                Expect.equal (hello Nothing) "Hello world"
        , test "foo" <|
            \_ ->
                Expect.equal (hello (Just "foo")) "Hello foo"
        ]
