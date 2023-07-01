import Test exposing (..)
import Expect exposing (..)
import Test.Runner.Html exposing (run)
import List
import Html
import Koch exposing (..)

tests = 
    describe "Koch"
    [describe "koch" 
        [test "at level 0 should return 1 segment" <|
            \() -> koch 0 |> Expect.equal [Forward]
            ,test "at level 1 should return 4 segments" <|
            \() -> koch 1 |> Expect.equal [Forward, Left, Forward, Right, Forward, Left, Forward]
            ,test "at level 2 should return 16 segments" <|
            \() -> koch 2 |> Expect.equal [
                Forward, Left, Forward, Right, Forward, Left, Forward,
                Left, 
                Forward, Left, Forward, Right, Forward, Left, Forward, 
                Right, 
                Forward, Left, Forward, Right, Forward, Left, Forward, 
                Left, 
                Forward, Left, Forward, Right, Forward, Left, Forward]
        ]
    ,describe "turtle"
        [test "when given a forward move, trace just a segment" <|
            \() -> turtle (0,0) 0 [Forward] |> Expect.equal [(0,0),(1,0) ]
        ,test "when given a different starting point, trace another a segment" <|
            \() -> turtle (42,42) 0 [Forward] |> Expect.equal [(42,42),(43,42)]
        ,test "when given a different angle, trace another segment" <|
            \() -> (turtle (0,0) angle [Forward]) |> List.map roundCoords |> Expect.equal [(0,0), (0.5,0.87)]
        ,test "when given a forward,left,forward, trace two segments" <|
            \() -> turtle (0,0) 0 [Forward,Left,Forward] |> List.map roundCoords |>
            Expect.equal [(0,0),(1,0),(1.5,0.87)]
        ,test "when given a forward,right,forward, trace two segments" <|
            \() -> turtle (0,0) 0 [Forward,Right,Forward] |> List.map roundCoords |>
            Expect.equal [(0,0),(1,0),(0.5,-0.87)]
        ]
    ]
    

main : Program Never
main = Test.Runner.Html.run tests


