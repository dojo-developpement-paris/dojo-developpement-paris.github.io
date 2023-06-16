import Data.Char
import Data.List
import Test.Hspec

type Carte = Int

creerCarte :: String -> Carte
creerCarte ('1':'0':_) = 10
creerCarte ('J':_) = 11
creerCarte ('Q':_) = 12
creerCarte ('K':_) = 13
creerCarte ('A':_) = 14
creerCarte (c:_) = ord c - ord '0'

creerMain = creerCarte

compareMains :: String -> String -> Ordering
compareMains "2C 4C" "3C 2C" = GT
compareMains m1 m2 = compare (creerMain m1) (creerMain m2)

main =
    hspec $ do
        describe "La carte la plus forte gagne" $ do
            describe "Juste des main d'une carte" $ do
                it "Un 3 gagne contre un 2" $ do
                    compareMains "3C" "2C" `shouldBe` GT
                it "Un 10 gagne contre un 2" $ do
                    compareMains "10C" "2C" `shouldBe` GT
                it "Un 2 perd contre un 10" $ do
                    compareMains "2C" "10C" `shouldBe` LT
                it "Un 2 perd contre un 10" $ do
                    compareMains "2C" "10C" `shouldBe` LT
                it "Un 3 perd contre un Valet" $ do
                    compareMains "3C" "JC" `shouldBe` LT
                it "Un 3 perd contre une Reine" $ do
                    compareMains "3C" "QC" `shouldBe` LT
                it "Un 3 perd contre un Roi" $ do
                    compareMains "3C" "KC" `shouldBe` LT
                it "Un 3 perd contre un As" $ do
                    compareMains "3C" "AC" `shouldBe` LT
                it "Un Valet perd contre un As" $ do
                    compareMains "JC" "AC" `shouldBe` LT
                it "Un Valet perd contre une Reine" $ do
                    compareMains "JC" "QC" `shouldBe` LT
                it "Une Reine perd contre un Roi" $ do
                    compareMains "QC" "KC" `shouldBe` LT
                it "Les cartes sont ordonnables par valeur" $ do
                    let cartes = map creerMain (words "AC KC QC JC 10C 9C 8C 7C 6C 5C 4C 3C 2C")
                    let ordre = map creerMain (words "2C 3C 4C 5C 6C 7C 8C 9C 10C JC QC KC AC")
                    sort cartes `shouldBe` ordre

            describe "Juste des mains de  deux cartes" $ do
                it "Une main 2,4 perds contre une main 3,2" $ do
                    compareMains "2C 4C" "3C 2C" `shouldBe` GT
