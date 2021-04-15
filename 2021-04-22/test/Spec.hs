import Test.Hspec

import Lib (compute, function)
import Control.Monad.Writer (writer)

main = hspec $ do
  describe "un programme" $ do
    describe "lecture de prix en input" $ do
      it "restitue un prix entier" $ do
        compute "4807\n" `shouldBe` "4807.00"
        compute "4808\n" `shouldBe` "4808.00"
        compute "347\n" `shouldBe` "347.00"
      it "restitue un nombre à virgules" $ do
        compute "347.5\n" `shouldBe` "347.50"
        compute "347.05\n" `shouldBe` "347.05"

