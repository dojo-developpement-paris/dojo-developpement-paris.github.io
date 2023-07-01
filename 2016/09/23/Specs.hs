import Test.Hspec
import JoinCords

main = hspec $ do
    describe "join" $ do
        describe "with only one male female cord" $ do
            it "returns this cord" $ do
                join [(Male,6,Female)]  `shouldBe` [(Male,6,Female)]
        describe "with only one cord with identical ends" $ do
            it "returns empty list" $ do
                join [(Male,42,Male)] `shouldBe` [] 
                join [(Female,42,Female)] `shouldBe` [] 
        describe "with two compatible cords" $ do
            it "returns two cords" $ do
                join [(Male,6,Female),(Male,4,Female)] `shouldBe` 
                    [(Male,6,Female),(Male,4,Female)]
        describe "with two incompatible cords" $ do
            it "returns one cord" $ do
                join [(Male,6,Female),(Male,4,Male)] `shouldBe` 
                    [(Male,6,Female)]
        describe "with one ortho cord and two distinct para" $ do
            it "returns all cords" $ do
                join [(Male,6,Female),(Male,4,Male),(Female,42,Female)]
                     `shouldBe` 
                    [(Male,6,Female),(Male,4,Male),(Female,42,Female)]
        describe "with different number of paras" $ do
            it "returns select the largest assembly" $ do
                join [(Female,6,Female),(Male,4,Male),(Female,42,Female)]
                     `shouldBe` 
                    [(Male,4,Male),(Female,42,Female)]
