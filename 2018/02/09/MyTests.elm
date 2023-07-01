module MyTests exposing (..)


import Test exposing (..)
import Expect
import Test.Runner.Html exposing (run)

import Bowling

spec : Test
spec = describe "the bowling game" 
    [ 
      test "when no bowl has been thrown, score is 0"
        <| \_ -> 
           let
              score = []
            in
              Expect.equal (Bowling.score score) 0
    , test "when 1 pin at each throw, score is 20"
        <| \_ -> 
           let
              score = List.repeat 20 1
            in
              Expect.equal (Bowling.score score) 20
    , test "spare"
        <| \_ -> 
           let
              score = [4, 6, 2]
            in
              Expect.equal (Bowling.score score) 14
    , test "spare but better"
        <| \_ -> 
           let
              score = [6, 4, 3]
            in
              Expect.equal (Bowling.score score) 16
    ]

main = run spec
