import Test.Hspec
import Monads

items = [("Apple",100), ("Grapefruit",200), ("Apricot",400)]
baskets = [("Season","Apple"), ("Salad","Apricot"), ("MyBasket","Grapefruit"), ("Exotic","Coconut")]
        

main = hspec $ do
    describe "a reference table" $ do
        describe "lookup" $ do
            it "should return [] when key not found" $ do
                lookup "Banana" items `shouldBe`  Nothing
                lookup "Christmas" baskets `shouldBe` Nothing 

            it "should return a value when key is found" $ do
                lookup "Apple" items   `shouldBe` Just 100
                lookup "Apricot" items `shouldBe` Just 400
                lookup "Season" baskets `shouldBe` Just "Apple"

            it "should be used into complex functions" $ do
                (lookup "Season" baskets >>= (`lookup` items)) `shouldBe`  Just 100
                (lookup "MyBasket" baskets >>= (`lookup` items)) `shouldBe` Just 200
                (lookup "Christmas" baskets >>= (`lookup` items))`shouldBe` Nothing
                (lookup "Exotic" baskets >>= (`lookup` items)) `shouldBe` Nothing

    describe "a calculator" $ do
        it "performs operations" $ do
            eval (Value 4807) `shouldBe` Right 4807
            eval (Divide (Value 8) (Value 2)) `shouldBe` Right 4
        
        it "should not crash" $ do
            eval (Divide (Value 9) (Value 0)) `shouldBe` Left "Divide by zero"
            eval (Divide (Value 145) (Divide (Value 8) (Value 0))) `shouldBe` Left "Ooops"

    
            
            

            

                
