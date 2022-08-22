module Fixtures exposing (..)

import Expect
import Test exposing (..)


type alias Fixture =
    () -> Test


noTests : Fixture
noTests () =
    describe "nothing" []


todoWithFailingTest : Fixture
todoWithFailingTest () =
    describe "todo then failing"
        [ test "done" (\_ -> Expect.fail "just cause")
        , todo "haven't done this yet"
        ]


todoWithPassingTest : Fixture
todoWithPassingTest () =
    describe "todo then passing"
        [ test "done" (\_ -> Expect.pass)
        , todo "haven't done this yet"
        ]


oneTest : Fixture
oneTest () =
    describe "a"
        [ describe "very"
            [ describe "nested"
                [ test "test" (\_ -> Expect.equal 1 1) ]
            ]
        ]


twoTests : Fixture
twoTests () =
    describe "both"
        [ test "one" (\_ -> Expect.pass)
        , test "two" (\_ -> Expect.fail "message")
        ]


noTestsDescription : String
noTestsDescription =
    "This `describe \"nothing\"` has no tests in it. Let's give it some!"
