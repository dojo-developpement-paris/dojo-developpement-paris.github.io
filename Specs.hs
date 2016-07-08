import Test.Hspec
import Romains

main = hspec $ do
    describe "romains" $ do
        it "devrait convertir 3333 en MMMCCCXXXIII" $ do
            romains 3333 `shouldBe` "MMMCCCXXXIII"

        it "devrait convertir 2333 en MMCCCXXXIII" $ do
            romains 2333 `shouldBe` "MMCCCXXXIII"

        it "devrait convertir 1333 en MCCCXXXIII" $ do
            romains 1333 `shouldBe` "MCCCXXXIII"

        it "devrait convertir 333 en CCCXXXIII" $ do
            romains 333 `shouldBe` "CCCXXXIII"
        
        it "devrait convertir 233 en CCXXXIII" $ do
            romains 233 `shouldBe` "CCXXXIII"

        it "devrait convertir 23 en XXIII" $ do
            romains 23 `shouldBe` "XXIII"

        it "devrait convertir 2 en II" $ do
            romains 2 `shouldBe` "II"

        it "devrait convertir 555 en DLV" $ do
            romains 555 `shouldBe` "DLV"

        it "devrait convertir 3949 en MMMCMXLIX" $ do
            romains 3949 `shouldBe` "MMMCMXLIX"

        it "devrait convertir 3494 en MMMCDXCIV" $ do
            romains 3494 `shouldBe` "MMMCDXCIV"

        it "devrait convertir 5000 en K" $ do
            romains 5000 `shouldBe` "K"

        it "devrait convertir 4000 en MK" $ do
            romains 4000 `shouldBe` "MK"

        it "devrait convertir 9 en IX" $ do
            romains 9 `shouldBe` "IX"


       
