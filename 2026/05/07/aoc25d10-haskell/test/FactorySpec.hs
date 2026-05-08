module FactorySpec (spec)
    where

import Test.Hspec
import Factory

spec :: SpecWith ()
spec = do
    describe "factory button" $ do
        it "switches a light on / off" $ do
            let lights = [False]
            let button = [0]
            let result = switch lights button
            result `shouldBe` [True]
            let new_result = switch result button
            new_result `shouldBe` [False]
        it "can switch several lights" $ do
            let lights = [False, False, False]
            let button = [0, 2]
            let result = switch lights button
            result `shouldBe` [True, False, True]
            switch result button `shouldBe` [False, False, False]
            switch lights [1] `shouldBe` [False, True, False]






