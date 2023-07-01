import Test.Hspec

data Cell = Live | Dead
    deriving(Show, Eq)

nextStep a@[[Live,Live,Live]
           ,[Dead,Dead,Dead]
           ,[Live,Live,Live]] = [[Dead,life neighbors cell,Dead] 
                                ,[Dead,Dead,Dead]
                                ,[Dead,Dead,Dead]]

   where
    cell = a!!0!!1
    neighbors = neighborCount 1 1 ([Dead,Dead,Dead]:a) 
    alive y x a = (a!!y!!x == Live)
    neighborCount y x a = cellCount y x a - if alive y x a then 1 else 0
    cellCount y x a = length $ filter (==Live) $ concat $ window y x a
    window y x a = map (slice3 x) $ slice3 y a
    slice3 n a = take 3 $ drop (n-1) a

nextStep a = [[Dead,Dead,Dead]
             ,[Dead,life neighbors cell,Dead]
             ,[Dead,Dead,Dead]]


    where
    a' = ([Dead,Dead,Dead]:a)
    cell = a'!!2!!1
    neighbors = neighborCount 2 1 a' 
    neighborCount y x a = cellCount y x a - if alive y x a then 1 else 0
    cellCount y x a = length $ filter (==Live) $ concat $ window y x a
    alive y x a = (a!!y!!x == Live)
    window y x a = map (slice3 x) $ slice3 y a
    slice3 n a = take 3 $ drop (n-1) a

 
life n c | n == 2 = c
         | n == 3 = Live
         | otherwise = Dead
main = hspec $ do
    describe "the game of life" $ do
        it "knows a lonely cell is going to die" $ do
            let a = [[Dead,Dead,Dead]
                    ,[Dead,Live,Dead]
                    ,[Dead,Dead,Dead]]
            nextStep a !! 1 !! 1 `shouldBe` Dead

        it "a well surrounded cell survives" $ do
            let a = [[Dead,Live,Dead]
                    ,[Dead,Live,Dead]
                    ,[Dead,Live,Dead]]
            nextStep a !! 1 !! 1 `shouldBe` Live 

        it "a cell with 3 neighbors should survive" $ do
            let a = [[Dead,Live,Dead]
                    ,[Live,Live,Dead]
                    ,[Dead,Live,Dead]]
            nextStep a !! 1 !! 1 `shouldBe` Live 

        it "a cell with 4 neighbors should die" $ do
            let a = [[Dead,Live,Dead]
                    ,[Live,Live,Live]
                    ,[Dead,Live,Dead]]
            nextStep a !! 1 !! 1 `shouldBe` Dead

        it "a dead cell surrounded with 4 live doesn't live" $ do
            let a = [[Dead,Live,Dead]
                    ,[Live,Dead,Live]
                    ,[Dead,Live,Dead]]
            nextStep a !! 1 !! 1 `shouldBe` Dead
            
        it "a dead cell surrounded with 2 live doesn't live" $ do
            let a = [[Dead,Dead,Dead]
                    ,[Live,Dead,Live]
                    ,[Dead,Dead,Dead]]
            nextStep a !! 1 !! 1 `shouldBe` Dead
        it "a border cell surrounded with 2 live should stay alive" $ do
            let a = [[Live,Live,Live]
                    ,[Dead,Dead,Dead]
                    ,[Live,Live,Live]]
            nextStep a !! 0 !! 1 `shouldBe` Live
        
