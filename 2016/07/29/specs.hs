import Test.Hspec
import Carpaccio

main = hspec $ do
    describe "total price" $ do
        it "should include a tax rate of 6.85%" $ do
            totalPrice 1.0   `shouldBe` 1.07
            totalPrice 10.0  `shouldBe` 10.68

    describe "extractFirst" $ do
        it "should extract the first item of a list" $ do
            let actual   = (Just ["foo","bar"]) >>= extractFirst 
                expected = Just "foo"
            actual  `shouldBe` expected

        it "should fail if the list is empty" $ do
           let actual  = ((Just []) >>= extractFirst) :: Maybe String
               expected = Nothing
           actual  `shouldBe` expected

    describe "parse" $ do
        it "should convert a string into a number" $ do
            let actual = Just "42.0" >>= parse 
                expected = Just 42.0
            actual  `shouldBe` expected 

        it "should fail if no parse" $ do
            let actual = Just "foo" >>= parse 
                expected = Nothing
            actual  `shouldBe` expected 

    describe "check range" $ do
        it "should admit a number in range" $ do
            let actual = Just 42.0 >>= checkRange 1000
                expected = Just 42.0
            actual  `shouldBe` expected

        it "should fail if number >= range" $ do
            let actual = Just 1000.0 >>= checkRange 1000
                expected = Nothing
            actual  `shouldBe` expected
