import Test.Hspec
import Pythtree

main = hspec $ do
    describe "a tree" $ do
        it "can be empty" $ do 
            grow 0 `shouldBe` Nil
            fromList [] `shouldBe` (Nil :: Tree Int)
        it "each branch has two hook" $ do 
            grow 1 `shouldBe` Branch 0 Nil Nil
            grow 2 `shouldBe` Branch 0 (Branch 0 Nil Nil) (Branch 0 Nil Nil)

        it "can be populated with a list" $ do
            fromList [42] `shouldBe` Branch 42 Nil Nil
            fromList [17] `shouldBe` Branch 17 Nil Nil
            fromList [42,17,23] `shouldBe` Branch 42 (Branch 17 Nil Nil) (Branch 23 Nil Nil)
