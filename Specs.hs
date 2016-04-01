import Test.Hspec
import Lags

main = hspec $ do
    describe "events" $ do
        it "yields an empty list given zero orders" $ do
            events []  `shouldBe` [] 

        it "yields 3 events given 1 order" $ do
            events [(3, 7, 14)]  `shouldBe` [Cash 3
                                            ,Rent 3 10 14
                                            ,Cash 10] 

        it "yields 6 events given 2 orders" $ do
            events [(0,5,10),(3,7,14)]  `shouldBe` [Cash 0
                                                   ,Rent 0 5 10
                                                   ,Cash 3
                                                   ,Rent 3 10 14
                                                   ,Cash 5
                                                   ,Cash 10]

    describe "values" $ do
        it "yields empty values given zero event" $ do
            value []  `shouldBe` 0

        it "yields a value when given 3 events" $ do
            value [Cash 0
                  ,Rent 0 5 10
                  ,Cash 5] `shouldBe` 10

        it "yields the max value when given 4 events" $ do
            value [Cash 0
                  ,Rent 0 5 10
                  ,Rent 0 5  6
                  ,Cash 5] `shouldBe` 10

        it "yields the max when given the demo case" $ do
            let es = events [(0,5,10),(3,7,14),(5,9,7),(6,9,8)]
            value es  `shouldBe` 18
            let es = events [(0,5,10),(3,7,14),(5,9,8),(6,9,7)]
            value es  `shouldBe` 18
            let es = events [(0,5,10),(3,7,14),(5,9,8),(6,9,7),(15,3,4)]
            value es  `shouldBe` 22
