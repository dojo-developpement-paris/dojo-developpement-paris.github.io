import Test.Hspec
import Forth

-- 2 DUP + is an instruction list
--
main = hspec $ do
    describe "Forth interpreter" $ do
        it "interprets a simple number" $ do
            forth "42" `shouldBe` [42]  
            forth "51" `shouldBe` [51]  
        it "interprets several numbers" $ do
            forth "42 51" `shouldBe`
                   [51,42]
            forth "42 51 17" `shouldBe`
                   [17,51,42]

        it "knows how to duplicate numbers" $ do
            forth "42 DUP" `shouldBe` 
                [42,42]
            forth "51 DUP" `shouldBe` 
                [51,51]
            forth "51 DUP 42" `shouldBe` 
                [42,51,51]

        it "knows how to add numbers" $ do
            forth "42 17 +"  `shouldBe` [59]
            forth "51 23 +"  `shouldBe` [74]
            
        it "knows how to subtract numbers" $ do
            forth "42 17 -"  `shouldBe` [25]
