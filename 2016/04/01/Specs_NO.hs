import Test.Hspec
import Lags

main = hspec $ do
    describe "value" $ do
        it "should be zero if zero orders" $ do
            value []  `shouldBe` 0

        it "with one order, should be the bid of the order" $ do
            value [(0, 5, 10)] `shouldBe` 10

        it "with two compatible orders, should be the sum of bids" $ do
            value [(0, 5, 10)
                  ,(5, 9,  7)]  `shouldBe` 17

        it "with two colliding orders, should be the maximum bid" $ do
            value [(3, 7, 14)
                  ,(0, 5, 10)]  `shouldBe`  14

        it "with two colliding orders following an order, should be the best value" $ do
            value [(0, 5, 10)
                  ,(5, 9,  7)
                  ,(6, 9,  8)]  `shouldBe` 18

        it "with two colliding orders followed by an order, should be the best value" $ do
            value [(0, 5, 10)
                  ,(3, 7, 14)
                  ,(5, 9,  7)]  `shouldBe` 17

        it "with the demo case, should be the best value" $ do
            value [(0, 5, 10)
                  ,(3, 7, 14)
                  ,(5, 9,  7)
                  ,(6, 9,  8)]  `shouldBe` 18
