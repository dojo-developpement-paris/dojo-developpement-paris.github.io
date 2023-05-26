module LifeSpec
  where

import Test.Hspec
import Life

spec :: SpecWith ()
spec = do
  describe "cells" $ do
    it "when dead and surrounded by death, remain dead" $ do
      let ground = ["..."
                   ,"..."
                   ,"..."]
      evolve ground `shouldBe` ground

    it "when alive but surrounded by death, die" $ do
      let ground = ["..."
                   ,".o."
                   ,"..."]
      evolve ground `shouldBe` ["..."
                               ,"..."
                               ,"..."]

    it "when alive and surrounded by 2 neighbors, stay alive" $ do
      let ground = ["o.."
                   ,".o."
                   ,"..o"]
      evolve ground `shouldBe` ["..."
                               ,".o."
                               ,"..."]

    it "alive cells with only one neighbor die" $ do
       let ground = ["o.oo"]
       evolve ground `shouldBe` ["...."]


