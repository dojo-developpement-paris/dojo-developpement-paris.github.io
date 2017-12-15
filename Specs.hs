import Test.Hspec

main = hspec $ do
    describe "welcome new client" $ do
        it "your account amount is 0" $ do
            inp = return "balance Bossavit"
            out = \s -> writer ((),s)
            execWriter (process inp out) `shouldBe` "0" 
