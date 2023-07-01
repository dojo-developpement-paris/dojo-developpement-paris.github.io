import Test   exposing (..)
import Expect exposing (..)
import Test.Runner.Html

import GameOfLife exposing (..)

suite : Test
suite = describe "Game of Life"
  [ describe "generation"
    [ describe "update cells in a world"
      [ test "given an empty world, returns an empty world" <|
          \()-> Expect.equal (generation []) []

      , test "given an single-cell world, returns a single *dead* cell world" <|
          \()-> Expect.equal (generation [[Live]]) [[Dead]]

      , test "given a flip, it flops" <|
          \()->
            let
              flip =
                [ [ Dead, Live, Dead]
                , [ Dead, Live, Dead]
                , [ Dead, Live, Dead]
                ]
              flop =
                [ [ Dead, Dead, Dead]
                , [ Live, Live, Live]
                , [ Dead, Dead, Dead]
                ]
            in
              Expect.equal (generation flip) flop
      ]
    ]
  , describe "generate"
    [ describe "in a world with a cell with 3 live neighbours"
      [ test "a cell can be born" <|
          let
            world =
              [ [ Dead, Live, Dead ]
              , [ Dead, Dead, Live ]
              , [ Live, Dead, Dead ]
              ]
          in
            \()-> Expect.equal (generate world 1 1) Live
      ]
    , describe "in a world with a cell with 1 live neighbour"
      [ test "a cell will die" <|
          let
            world =
              [ [ Dead, Dead, Dead ]
              , [ Dead, Live, Dead ]
              , [ Live, Dead, Dead ]
              ]
          in
            \()-> Expect.equal (generate world 1 1) Dead
      ]
    ]
  , describe "evolve"
    [ test "a dead cell without neighbours should STAY DEAD" <|
        \()-> Expect.equal (evolve 0 Dead) Dead

    , test "a live cell with 2 neighbours should be staying aliiiiiiiiiiive!" <|
        \()-> Expect.equal (evolve 2 Live) Live

    , test "a dead cell with 2 neighbours should stay dead again" <|
        \()-> Expect.equal (evolve 2 Dead) Dead

    , test "a dead cell with 3 neighbours should be born again (halleluja)" <|
        \()-> Expect.equal (evolve 3 Dead) Live
    ]
  , describe "neighbours"
    [ describe "in a world of 3x3 cells"
      [ test "there can be two neighbours to the top left corner" <|
          \()->
            let
              world =
                [ [ Dead, Live, Dead ]
                , [ Dead, Live, Live ]
                , [ Live, Dead, Dead ]
                ]
            in
              Expect.equal (neighbours world 0 0) 2
      , test "there can be three neighbours to the center" <|
          \()->
            let
              world =
                [ [ Dead, Live, Dead ]
                , [ Dead, Live, Live ]
                , [ Live, Dead, Dead ]
                ]
            in
              Expect.equal (neighbours world 1 1) 3
      , test "there can be one neighbour to the center" <|
          \()->
            let
              world =
                [ [ Dead, Live, Dead ]
                , [ Dead, Live, Dead ]
                , [ Dead, Dead, Dead ]
                ]
            in
              Expect.equal (neighbours world 1 1) 1
      , test "there can be one neighbour to the center, even when it's dead" <|
          \()->
            let
              world =
                [ [ Dead, Live, Dead ]
                , [ Dead, Dead, Dead ]
                , [ Dead, Dead, Dead ]
                ]
            in
              Expect.equal (neighbours world 1 1) 1
      ]
    , describe "in a world of 4x4 cells"
      [ test "there can be three neighbours to the (1, 1) cell" <|
          \()->
            let
              world =
                [ [ Dead, Live, Dead, Dead ]
                , [ Dead, Live, Live, Live ]
                , [ Live, Dead, Dead, Dead ]
                , [ Live, Dead, Dead, Dead ]
                ]
            in
              Expect.equal (neighbours world 1 1) 3
      ]
    ]
  ]

main : Program Never
main = Test.Runner.Html.run suite
