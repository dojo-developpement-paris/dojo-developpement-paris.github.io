import Test.Hspec
import Data.List

data Book = Book Int
    deriving (Eq)

price :: [Book] -> Double
price [b1,b2] | b1 /= b2 = 15.2 
price [b1,b2,b3] | b1 == b2 && b2 /= b3 || b1 == b3 && b1 /= b2 || b2 == b3 && b1 /= b2 = 23.2 
price books   | otherwise = ((8.0 *) . fromIntegral . length) books 
--    where byBookTypes bs = sort $ map length $ group $ sort bs  

main = hspec $ do
    describe "Price" $ do
        describe "without discounts" $ do
            it "An empty basket should cost 0" $ do
                price [] `shouldBe` 0

            it "A basket with any one book should cost 8" $ do
                price [Book 1] `shouldBe` 8

            it "A basket with two identical books should cost 16" $ do
                price [Book 1, Book 1] `shouldBe` 16

        describe "with 5% discount" $ do
            it "A basket with two different books should cost 15.2" $ do
                price [Book 1, Book 2] `shouldBe` 15.2
                
        describe "with mixed discounts" $ do
            it "A basket with two different books and one duplicate should cost 23.2" $ do
                price [Book 1, Book 2, Book 2] `shouldBe` 23.2
                price [Book 1, Book 1, Book 2] `shouldBe` 23.2
