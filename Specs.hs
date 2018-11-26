import Test.Hspec
import Control.Monad.Writer (writer, runWriter)
import Bank


out = \s -> writer ((),s)

main = hspec $ do 
    describe "Bank" $ do
        it "outputs pretty report" $ do
                let run = bank [] out
                (lines.snd) (runWriter run)  `shouldBe` 
                        ["Solde initial : 0"
                        ,"Date | Debit | Credit"
                        ,"Solde : 0"
                        ]
        it "reports a deposit" $ do
                let run = bank [Deposit "26/11/2018" 4807] out
                (lines.snd) (runWriter run)  `shouldBe` 
                        ["Solde initial : 0"
                        ,"Date | Debit | Credit"
                        , "26/11/2018 | | 4807"
                        ,"Solde : 4807"
                        ]
    describe "Balance" $ do
        it "should compute a new balance" $ do
                balance [] `shouldBe` 0
                balance [Deposit "26/11/2018" 4807] `shouldBe` 4807
