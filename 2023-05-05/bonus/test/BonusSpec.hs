module BonusSpec (spec) where

import Test.Hspec
import Data.Function

data Contrat = Signature
             | Anniversaire Contrat
             | Accident Contrat

-- e.g. accident en 2ème année = Accident (Anniversaire Signature)
--                             = Signature & Anniversaire & Accident

coefficientBonusMalus :: Contrat -> Int
coefficientBonusMalus Signature = 100
coefficientBonusMalus (Anniversaire c) = div (coefficientBonusMalus c * 95) 100

annéesHeureuses :: Int -> Contrat
annéesHeureuses 0 = Signature
annéesHeureuses n = Anniversaire (annéesHeureuses (n-1))

spec :: SpecWith ()
spec = do
  describe  "le coefficient bonus/malus" $ do
    describe "la première année" $ do
      it "démarre à 100" $ do
        let contrat = annéesHeureuses 0
        coefficientBonusMalus contrat `shouldBe` 100

      it "avec accident responsable" $ do
        let contrat = Signature & Accident      -- ( x & f = f x )
        coefficientBonusMalus contrat `shouldBe` 125

    describe "la deuxième année" $ do
      it "sans accident" $ do
        let contrat = annéesHeureuses 1
        coefficientBonusMalus contrat `shouldBe` 95
    describe "la troisième année" $ do
      it "sans accident" $ do
        let contrat = annéesHeureuses 2
        coefficientBonusMalus contrat `shouldBe` 90
    describe "la sixième année" $ do
      it "sans accident" $ do
        let contrat = annéesHeureuses 5
        coefficientBonusMalus contrat `shouldBe` 76
