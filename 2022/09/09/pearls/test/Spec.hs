import Test.Hspec


main :: IO ()
main = hspec $ do
    describe "a pearl checker" $ do
        it "checks a 1 char chain" $ do
            checkPearls "0" `shouldBe` True
            checkPearls "1" `shouldBe` True
            checkPearls "2" `shouldBe` True
        it "checks a 2 chars chain" $ do
            checkPearls "00" `shouldBe` False
            checkPearls "11" `shouldBe` False
            checkPearls "01" `shouldBe` True
            checkPearls "10" `shouldBe` True
        it "checks a 3 chars chain" $ do
            checkPearls "001" `shouldBe` False
            checkPearls "011" `shouldBe` False
            checkPearls "010" `shouldBe` True
        it "checks a 4 chars chain" $ do
            checkPearls "0100" `shouldBe` False
            checkPearls "0101" `shouldBe` False
            checkPearls "0120" `shouldBe` True
        it "checks a 5 chars chain" $ do
            checkPearls "01001" `shouldBe` False
            checkPearls "21010" `shouldBe` False
            checkPearls "21012" `shouldBe` True
            checkPearls "01012" `shouldBe` False
            checkPearls "01201" `shouldBe` True
        it "checks a 6 chars chain" $ do
            checkPearls "O12O12" `shouldBe` False
        it "checks a 8 chars chain" $ do
            checkPearls "01020102" `shouldBe` False

checkPearls :: String -> Bool
checkPearls [_]   = True
checkPearls list = all (checkPearls' list) [1..length list `div` 2] && checkPearls (tail list) 

checkPearls' list size = take size list /= take size (drop size list)
checkPearls' _ _ = True
