import Test.Hspec

data Cell = Cell Integer Cell
          | End
    deriving (Show, Eq)

n = 2

west (Cell x End) = Cell ( x - (n * (x `mod` n)) + 1) End

east (Cell outer (Cell inner End)) 
    | isBorder  = Cell outer' x
    | otherwise = Cell outer  x
    
    where 
    (Cell outer' End) = east (Cell outer End)
    x = east (Cell inner End)
    isBorder = inner `mod` n == 1

east (Cell x End) = Cell ( x - (n * (x `mod` n)) + 1) End

north (Cell x End) = Cell (x `mod` n) End

south (Cell x End) = Cell ((x `mod` n) + n) End

main = hspec $ do
    describe "level 1" $ do
        describe "west neighbour" $ do
            it "west" $ do
                west (Cell 0 End) `shouldBe` Cell 1 End
                west (Cell 1 End) `shouldBe` Cell 0 End
                west (Cell 2 End) `shouldBe` Cell 3 End
                west (Cell 3 End) `shouldBe` Cell 2 End
        describe "east neighbour" $ do
            it "east" $ do
                east (Cell 0 End) `shouldBe` Cell 1 End
                east (Cell 1 End) `shouldBe` Cell 0 End
                east (Cell 2 End) `shouldBe` Cell 3 End
                east (Cell 3 End) `shouldBe` Cell 2 End
        describe "north neighbour" $ do
            it "north" $ do
                north (Cell 0 End) `shouldBe` Cell 0 End
                north (Cell 1 End) `shouldBe` Cell 1 End
                north (Cell 2 End) `shouldBe` Cell 0 End
                north (Cell 3 End) `shouldBe` Cell 1 End
        describe "south neighbour" $ do
            it "south" $ do
                south (Cell 0 End) `shouldBe` Cell 2 End
                south (Cell 1 End) `shouldBe` Cell 3 End
                south (Cell 2 End) `shouldBe` Cell 2 End
                south (Cell 3 End) `shouldBe` Cell 3 End
    describe "level 2" $ do
        it "east" $ do
            east (Cell 0 (Cell 0 End)) `shouldBe` Cell 0 (Cell 1 End)
            east (Cell 0 (Cell 2 End)) `shouldBe` Cell 0 (Cell 3 End)
            east (Cell 1 (Cell 0 End)) `shouldBe` Cell 1 (Cell 1 End)
            east (Cell 0 (Cell 3 End)) `shouldBe` Cell 1 (Cell 2 End)
            east (Cell 2 (Cell 1 End)) `shouldBe` Cell 3 (Cell 0 End)
            east (Cell 1 (Cell 1 End)) `shouldBe` Cell 0 (Cell 0 End)
           
