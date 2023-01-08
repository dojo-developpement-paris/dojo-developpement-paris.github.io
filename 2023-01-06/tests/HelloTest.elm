module HelloTest exposing (suite)

import Expect
import Main exposing (suggere)
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Suggesteur"
        [ test "Suggere rien si le nom de domaine est deja connu" <|
            \_ ->
                Expect.equal (suggere "toto@gmail.com") Nothing
        , test "Suggere gmail si le nom de domaine est gamil" <|
            \_ ->
                Expect.equal (suggere "toto@gamil.com") (Just "toto@gmail.com")
        , test "Suggere *@gmail si le nom de domaine est *@gamil" <|
            \_ ->
                Expect.equal (suggere "random@gamil.com") (Just "random@gmail.com")
        , test "Suggere gmail si le nom de domaine est gmal" <|
            \_ ->
                Expect.equal (suggere "toto@gmal.com") (Just "toto@gmail.com")
        ]
