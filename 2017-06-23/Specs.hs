import Test.Hspec
import qualified Data.Sequence as S (update, fromList, Seq, replicate, index)
import Data.Foldable (toList)

shouldBeGrid actual expected = shouldBe actual (S.fromList (fmap S.fromList expected))
main = hspec $ do
    describe "a starting grid" $ do
        it "is a 4x4 grid" $ do
            startingGrid []  `shouldBeGrid` (replicate 4 (replicate 4 0))

        it "can be filled with a 2 at (0,0)" $ do
            startingGrid [((0,0),2)] `shouldBeGrid` ([2,0,0,0] : replicate 3 (replicate 4 0))

        it "can be filled with a 2 at (0,1)" $ do
            startingGrid [((0,1),2)] `shouldBeGrid` ([0,2,0,0] : replicate 3 (replicate 4 0))

        it "can be filled with a 2 at (1,1)" $ do
            startingGrid [((1,1),2)] `shouldBeGrid` ([0,0,0,0]:[0,2,0,0] : replicate 2 (replicate 4 0))

        it "can be filled with 1 and 2 at (0,0) and (0,1)" $ do
            startingGrid [((0,0),1),((0,1),2)] `shouldBeGrid`  ([1,2,0,0] : replicate 3 (replicate 4 0))



type PowerOf2 = Int
type Grid = S.Seq (S.Seq PowerOf2)
type Position = (Int,Int)

startingGrid :: [(Position,PowerOf2)] -> S.Seq (S.Seq PowerOf2)
startingGrid = foldl insertAt initial
    where
    initial = S.replicate 4 $ S.replicate 4 0
    insertAt seq ((j,i),n) = S.update j (putOnCol i n) seq
        where
        putOnCol i n = S.update i n currentLine
        currentLine = S.index seq  j

           
