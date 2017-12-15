import Test.Hspec
import Banking
import Control.Monad.Writer


out = \s -> writer ((),s)

main = hspec $ do
    describe "welcome new client" $ do
        it "your account amount is 0" $ do
            execWriter  (process (return "foo") out) `shouldBe` "0" 
