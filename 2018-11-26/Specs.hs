import Test.Hspec
import Control.Monad.Writer (writer, runWriter)
import Bank

out = \s -> writer ((),s)

main = hspec $ do 
    describe "Bank" $ do
        it "outputs a number" $ do
                let run = bank out
                (lines.snd) (runWriter run)  `shouldBe` ["4807"]
