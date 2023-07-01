import Test.Hspec
import Rover
-- L : left 90
-- R : right 90
-- M : move forward
--
-- on a 10x10 grid
--

main = hspec $ do
    describe "Perseverance" $ do
        it "starts at (0,0) facing North" $ do
            rover ""  `shouldBe` "0 0 N"

        it "should rotate on the right" $ do
            rover "R" `shouldBe` "0 0 E"
            rover "RR" `shouldBe` "0 0 S"
            rover "RRR" `shouldBe` "0 0 W"
            rover "RRRR"  `shouldBe` "0 0 N"
            rover "RRRRR"  `shouldBe` "0 0 E"
            rover "MMR" `shouldBe` "0 2 E"

        it "should rotate on the left" $ do
            rover "L" `shouldBe` "0 0 W"
            rover "LL" `shouldBe` "0 0 S"
            rover "LLL" `shouldBe` "0 0 E"
            rover "LLLL"  `shouldBe` "0 0 N"
            rover "LLLLL"  `shouldBe` "0 0 W"
            rover "MML" `shouldBe` "0 2 W"

        it "should move forward in its direction" $ do
            rover "M" `shouldBe` "0 1 N"
            rover "MM" `shouldBe` "0 2 N"
            rover "RM" `shouldBe` "1 0 E"
            rover "RMLLM" `shouldBe` "0 0 W"
            rover "RRMLLM" `shouldBe` "0 0 N"

        it "should move beyond the limit, and back in the square" $ do
            rover "LM"  `shouldBe` "9 0 W"
            rover "LLM" `shouldBe` "0 9 S"

