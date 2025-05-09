module Loner
    where


--   1
--   110 → 001
--   011 → 100
--  1011 → 1100 → 0010
--  0001 == 1
--  001  == 1
--  0*1 = Yes
--  1$
--  10
type Board = String
type Parser = Board -> (Bool,Board)

parseEnd :: Parser
parseEnd "" = (True, "")
parseEnd board = (False, board)

parsePawn :: Parser
parsePawn ('1':rest) = (True, rest) 
parsePawn board   = (False, board)

parseEmpty :: Parser
parseEmpty ('0':rest) = (True,rest)
parseEmpty board = (False, board)

parseAndThen :: Parser -> Parser -> Parser
parseAndThen parseA parseB board =
    case parseA board of
      (True, rest) -> parseB rest
      (False, _)   -> (False, board)

loner :: Board -> Bool
loner board = (fst ((parsePawn `parseAndThen` parseEnd) board))
    || (fst ((parsePawn `parseAndThen` parseEmpty `parseAndThen` parseEnd) board))


