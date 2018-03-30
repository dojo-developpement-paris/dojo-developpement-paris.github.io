import Test.Hspec
import EloChart

main = hspec $ do
    describe "a player chart" $ do
        it "should contain added players" $ do
            let chart = add "Barb" (add "Abel" newChart)
            display chart `shouldBe` "Barb : 1500.0\nAbel : 1500.0\n"

            let chart = add "Dany" (add "Carl" newChart)
            display chart `shouldBe` "Dany : 1500.0\nCarl : 1500.0\n"
