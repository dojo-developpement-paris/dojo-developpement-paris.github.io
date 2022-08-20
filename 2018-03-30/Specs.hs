import Test.Hspec
import EloChart

main = hspec $ do
    describe "a player chart" $ do
        it "should contain added players" $ do
            let chart = add "Barb" (add "Abel" newChart)
            display chart `shouldBe` "Barb : 1500.0\nAbel : 1500.0\n"

            let chart = add "Dany" (add "Carl" newChart)
            display chart `shouldBe` "Dany : 1500.0\nCarl : 1500.0\n"

        it "should not add an existing player" $ do
            let chart = add "Abel" (add "Barb" (add "Abel" newChart))
            display chart `shouldBe` "Barb : 1500.0\nAbel : 1500.0\n"

    describe "a match" $ do
        it "should increase the rank of the winner" $ do
            let chart = add "Barb" (add "Abel" newChart)
                chart' = match "Barb" "Abel" 1 chart
            display chart' `shouldBe` "Barb : 1520.0\nAbel : 1480.0\n"

            let chart = add "Barb" (add "Abel" newChart)
                chart' = match "Barb" "Abel" 0 chart
            display chart' `shouldBe` "Abel : 1520.0\nBarb : 1480.0\n"
            
            let chart = add "Barb" (add "Abel" newChart)
                chart' = match "Barb" "Abel" 0.5 chart
            display chart' `shouldBe` "Barb : 1500.0\nAbel : 1500.0\n"

            -- 1500 + 40 * (1 - 1 / (1+10 ** (-(1500-1500)/400)))

{--
En+1 = En + Kn x (W - p(D))

D = En - F
F = Elo rank of opponent
p(D) = 1 / (1 + 10^(-D/400) )

K = 40 if n ≤ 30
K = 20 if En < 2400
K = 10 if EN ≥ 2400

W = 1 if player won
W = 0.5 if equality
W = 0 if player lost
--}
