module LadderSpec where
import Test.Hspec
import WordLadder

spec :: Spec
spec = do
    describe "wordLadder" $ do
        describe "gives the ladder" $ do
            it "with 1 step distance" $ do
                wordLadder "plain" "plaid" `shouldBe`["plain","plaid"]
                wordLadder "plank" "plant" `shouldBe`["plank","plant"]
                wordLadder "plane" "plant" `shouldBe`["plane","plant"]
                wordLadder "place" "plate" `shouldBe` ["place","plate"]

            it "with 2 step distance" $ do 
                wordLadder "place" "plant" `shouldBe` ["place", "plane", "plant"]

