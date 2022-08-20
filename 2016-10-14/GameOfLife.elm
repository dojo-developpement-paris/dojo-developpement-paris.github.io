module GameOfLife exposing (..)

import List  exposing (sum, map, filter, length, indexedMap)
import Array exposing (fromList, get, slice, toList)
import Maybe exposing (andThen, withDefault)

type Cell = Live | Dead

generation w = indexedMap (\y l -> indexedMap (\x c -> generate w y x) l ) w

generate w y x =
  let
    n = neighbours w y x
    c = cellAt w y x
  in
    evolve n c

evolve n c = case n of
  2 -> c
  3 -> Live
  _ -> Dead

neighbours w y x =
  let
    slice' n = toList << slice (max 0 (n - 1)) (n + 2) << fromList
    neighbourhood y x = map (slice' x) << slice' y
    count = sum <| map (length) <| map (filter ((==) Live)) (neighbourhood y x w)
  in
    case (cellAt w y x) of
      Dead -> count
      Live -> count - 1

cellAt w y x = withDefault Dead <| (get y <| fromList w) `andThen` (\l -> get x <| fromList l)
