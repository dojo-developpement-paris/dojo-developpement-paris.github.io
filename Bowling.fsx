type Turn = 
    | First of int
    | Second of (int * int)

type Frame = 
    | YourTurn
    | First of int
    | Second of (int * int * Frame)
    | Spare of int * int * Frame
    | Strike of Frame

let frame = function
    | First 10 -> Strike YourTurn
    | Second (10,_, frame) -> Strike frame
    | Second (x, y, frame) when x + y = 10 -> Spare (x, y, frame)
    | other -> other

let first = function
    | First x 
    | Second (x, _, _) 
    | Spare (x, _, _) -> x
    | Strike _ -> 10
    | YourTurn -> 0

frame (Second(5,5,YourTurn)) = Spare(5,5,YourTurn)
frame (YourTurn) = YourTurn
frame (First 10) = Strike YourTurn
frame (Second (10,0, YourTurn)) = Strike YourTurn

let score x = 
    let rec score result current = 
        match frame current with
        | YourTurn -> result
        | First x -> result + x
        | Second (x, y, nextFrame) -> score (result + x + y) nextFrame
        | Spare (x, y, nextFrame) -> score (result + 10 + (first nextFrame)) nextFrame
        | Strike (next) -> score (result + 10 + first next) next

    score 0 x

score YourTurn = 0
score (Spare  (5, 5, (Second (5, 0, YourTurn)))) = (10 + 5) + 5 + 0
score (Second (5, 0, (Spare  (5, 5, YourTurn)))) = 5 + (10 + 0) + 0
score (Spare  (7, 3, (Spare  (5, 5, Second (2,0, YourTurn))))) = (10 + 5) + (10 + 2) + 2 + 0
score (First 5) = 5

score (Strike YourTurn) = 10
score (Strike (Strike YourTurn)) = (10 + 10 + 0) + (10 + 0 + 0) + 0
score (Strike (Strike (Second (2, 3, YourTurn)))) = (10 + 10 + 2) + (10 + 2 + 3) + 5 + 0

let add previous current = failwith ""

add YourTurn (First 10) = Strike YourTurn