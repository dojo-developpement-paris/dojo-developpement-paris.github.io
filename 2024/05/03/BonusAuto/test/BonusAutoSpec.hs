module BonusAutoSpec
    where

import BonusAuto

import Test.Hspec

spec :: SpecWith ()
spec = do
    describe "bonus" $ do
        it "le bonus d'un nouveau conducteur est de 100%" $ do
            bonus newDriver `shouldBe` 100

        it "après un an le bonus est de 95%" $ do
            bonus (driver 1) `shouldBe` 95
        it "après deux ans sans accident, 90%" $ do
            bonus (driver 2) `shouldBe` 90
        it "après trois ans sans accident, 85%" $ do
            bonus (driver 3) `shouldBe` 85
        it "après cinq ans sans accident, 76%" $ do
            bonus (driver 5) `shouldBe` 76
        it "accident la premiere année, 125%" $ do
            bonus (crashed newDriver) `shouldBe` 125
        it "accident la premiere année, 156%" $ do
            bonus (crashed (crashed newDriver))
                `shouldBe` 156
        it "jamais moins de 50% !!" $ do
            bonus (driver 25) `shouldBe` 50



