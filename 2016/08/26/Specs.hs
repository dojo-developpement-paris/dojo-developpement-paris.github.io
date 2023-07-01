import Test.Hspec
import Bonus

main = hspec $ do
    describe "sans accident au cours de l'année précédente" $ do
        describe "prochain coefficient de réduction de majoration" $ do
            it "commence à 100" $ do
                crm 0  `shouldBe` 100
                coefficientInitial  `shouldBe` 100

            it "réduit de 5% par rapport à l'année précédente" $ do
                crm 1  `shouldBe` 95
                coefficientSuivant coefficientInitial 0  `shouldBe` 95 

            it "en gardant un pourcentage entier" $ do
                crm 2  `shouldBe` 90
                coefficientSuivant (
                    coefficientSuivant coefficientInitial 0) 0
                         `shouldBe` 90 
                crm 5  `shouldBe` 76 
                crm 12 `shouldBe` 51 

            it "ne descend pas en dessous de 50%" $ do
                crm 13 `shouldBe` 50
                crm 14 `shouldBe` 50

    describe "avec sinistres responsables " $ do
        describe "prochain coefficient de réduction de majoration" $ do
            it "augmente de 25% par sinistre" $ do
                let precedent = 100
                    sinistresResponsables = 1
                coefficientSuivant precedent sinistresResponsables
                     `shouldBe` 125

                coefficientSuivant precedent 2  `shouldBe` 150

                coefficientSuivant 50 2 `shouldBe` 75 
                



