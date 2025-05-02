module Main (main) where

import Test.Hspec

main :: IO ()
main =
    hspec $ do
        describe "loner" $ do
            it "trivial case" $ do
                loner "1" `shouldBe` True
                loner "0" `shouldBe` False
            it "couscous" $ do
                loner "110" `shouldBe` True
        describe "parser" $ do
            it "simple parser" $ do
                emptyCell "0" `shouldBe` (True, "")
                emptyCell "1" `shouldBe` (False, "1")
                emptyCell "0111" `shouldBe` (True, "111")
                pawn "1" `shouldBe` (True, "")
                pawn "0" `shouldBe` (False, "0")
                pawn "1001" `shouldBe` (True, "001")
        describe "andThen" $ do
            it "parser several parser" $ do
                (pawn `andThen` emptyCell) "101" `shouldBe` (True, "1")
                (pawn `andThen` emptyCell) "001" `shouldBe` (False, "001")
                (pawn `andThen` emptyCell) "111" `shouldBe` (False, "111")
                (pawn `andThen` pawn `andThen` emptyCell) "110" `shouldBe` (True, "")
        describe "orElse" $ do
            it "parser several parser" $ do
                (pawn `orElse` emptyCell) "101" `shouldBe` (True, "01")
                (pawn `orElse` emptyCell) "011" `shouldBe` (True, "11")
                (pawn `orElse` pawn) "0" `shouldBe` (False, "0")
                ((pawn `orElse` (pawn `andThen` pawn)) `andThen` emptyCell) "110" `shouldBe` (True, "")

type Board = String
type Result = Bool

type Parser = Board -> (Result, Board)

andThen :: Parser -> Parser -> Parser
andThen parserA parserB board =
    case parserA board of
        (False, _) -> (False, board)
        (True, remaining) -> case parserB remaining of
            (False, _) -> (False, board)
            result -> result

orElse :: Parser -> Parser -> Parser
orElse parserA parserB board =
    case parserA board of
        (False, _) -> parserB board
        result -> result

emptyCell :: Parser
emptyCell ('0' : whatEver) = (True, whatEver)
emptyCell whatEver = (False, whatEver)

pawn :: Parser
pawn ('1' : whatEver) = (True, whatEver)
pawn whatEver = (False, whatEver)

loner :: Board -> Bool
loner board = fst ((pawn `orElse` (pawn `andThen` (pawn `andThen` emptyCell))) board)

-- 0 arbre de choix
-- 2 regexp
-- 5 faire un parser
