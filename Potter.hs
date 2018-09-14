import Test.Hspec 
import Data.List

main = hspec $
    describe "the Potter book sales" $ do
        it "Empty basket costs nothing" $ 
            calc ( []) `shouldBe` 0
        it "One book costs 8 euros" $ do
            calc ( [TomeOne]) `shouldBe` 8
            calc ( [TomeTwo]) `shouldBe` 8
        it "multiple copies of the same tome give no discount" $ do
            calc ( [TomeTwo, TomeTwo])  `shouldBe` 16
            calc ( [TomeTwo, TomeTwo, TomeTwo])  `shouldBe` 24
            calc ( replicate 4 TomeTwo)  `shouldBe` 32
        it "two different tomes give a discount" $ do
            calc ( [TomeOne, TomeTwo]) `shouldBe` 15.2
            calc ( [TomeOne, TomeOne, TomeTwo, TomeTwo]) `shouldBe` 30.4 

type Books = [Book]
data Book = TomeOne
          | TomeTwo
       deriving (Eq, Ord)

type Price = Float
type Quantity = Int

calc :: Books -> Price
calc =  discount . calcSets 

calcSets :: [Book] -> [Quantity] 
calcSets l = map length $ group $ sort l

basePrice :: [Quantity] -> Float
basePrice =  fromIntegral . (8*) . foldl (+) 0

discount sets@[_,_] = 15.2 + (discount $ filter (==0) $ map ((-)1) sets)
discount sets = basePrice sets


