import Test.Hspec
import System.Directory
import Control.Monad
import Bank

removeFileIfAny :: IO ()
removeFileIfAny = do
    fileExists <- doesFileExist "ACCOUNT.TXT"
    when fileExists $ removeFile "ACCOUNT.TXT"

assertFileContentIs :: String -> Expectation 
assertFileContentIs expected = do
    content <- readFile "ACCOUNT.TXT"
    content  `shouldBe` expected

main = do
    hspec $ do
    describe "deposit integration test" $ do
        it "after deposit 10, a file should contain 10" $ do
            removeFileIfAny
            deposit 10
            assertFileContentIs "Deposit 10\n"

        it "after deposit 42, a file should contain 42" $ do
            removeFileIfAny
            deposit 42
            assertFileContentIs "Deposit 42\n"

        it "after several deposits, a file should contain all deposits" $ do
            removeFileIfAny 
            deposit 34
            deposit 700
            assertFileContentIs "Deposit 34\nDeposit 700\n"
            deposit 1000
            assertFileContentIs "Deposit 34\nDeposit 700\nDeposit 1000\n"

