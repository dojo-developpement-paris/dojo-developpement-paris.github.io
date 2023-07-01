module Tests

open Expecto

(*
  2 1 5 3 -> 11
  3 7 2 0 -> 14
  10 4 4  -> 26
  1 3 7 2 -> 13
  10 10 1 1 -> (10 + 10 + 1) + (10 + 1 + 1) + 1 + 1 -> 35
  7 3 7 3 1 0 -> (10 + 7) + (10 + 1) + 1 + 0 -> 29
  1 7 3 2 -> (10 + 7) + (10 + 1) + 1 + 0 -> 29
*)

let rec score throws =
  let rec score' count throws =
    match throws with
    | list when List.length list = 12 ->
      300
    | 10 :: secondThrow :: thirdThrow :: otherThrows ->
      10 + secondThrow + thirdThrow + score' (count + 1) ( secondThrow :: thirdThrow :: otherThrows)
    | firstThrow :: secondThrow :: thirdThrow :: otherThrows
        when firstThrow + secondThrow = 10 ->
      firstThrow + secondThrow + thirdThrow + score' (count + 1) (thirdThrow::otherThrows)
    | firstThrow :: secondThrow :: otherThrows ->
      firstThrow + secondThrow + score' (count + 1) otherThrows
    | _ ->
      List.sum throws

  score' 0 throws


[<Tests>]
let tests =
  testList "scores" [
    testCase "only zeroes" <| fun _ ->
      let result = score [0;0]
      Expect.equal result 0 "score of two 0 should be 0"

    testCase "neither strike nor spare" <| fun _ ->
      let result = score [1;2;3;4]
      Expect.equal result 10 "score of normal throw should be the sum"

    testCase "when spare next score should double" <| fun _ ->
      let result = score [3;7;2;0]
      Expect.equal result 14 "score of spare throw should double the next throw"

    testCase "should give sum when nothing special" <| fun _ ->
      let result = score [1;3;7;2]
      Expect.equal result 13 "should work"

    testCase "when strike next two score should double" <| fun _ ->
      let result = score [10;2;2]
      Expect.equal result 18 "score of strike should double the next two throws"

    testCase "spare should work even if not at the begining" <| fun _ ->
      let result = score [1;1;5;5;1]
      Expect.equal result 14 "spare scoring should work at the middle of the list"

    testCase "two spares in a row" <| fun _ ->
      let result = score [7;3;7;3;1;0]
      Expect.equal result 29 "two spare in a row should work"

    testCase "two strikes in a row" <| fun _ ->
      let result = score [10;10;1;0]
      Expect.equal result 33 "should work"

    testCase "spare should work even if zero is first" <| fun _ ->
      let result = score [0;10;1;1]
      Expect.equal result 13 "should work"

    testCase "perfect score" <| fun _ ->
      let result = score (List.replicate 12 10)
      Expect.equal result 300 "should work"


  ]
