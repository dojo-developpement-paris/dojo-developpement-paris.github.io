import Test.Hspec
import Data.Function ((&))
import Data.Char (ord)

type LcdDigit = [String]

lcdDigit :: Int -> LcdDigit
lcdDigit 0 = [" _ ",
              "| |",
              "|_|"]
lcdDigit 1 = ["   ",
              "  |",
              "  |"]
lcdDigit 2 = [" _ ",
              " _|",
              "|_ "]
lcdDigit 3 = [" _ ",
              " _|",
              " _|"]
lcdDigit 4 = ["   ",
              "|_|",
              "  |"]
lcdDigit 5 = [" _ ",
              "|_ ",
              " _|"]
lcdDigit 6 = [" _ ",
              "|_ ",
              "|_|"]
lcdDigit 7 = [" _ ",
              "  |",
              "  |"]
lcdDigit 8 = [" _ ",
              "|_|",
              "|_|"]
lcdDigit 9 = [" _ ",
              "|_|",
              " _|"]

type LcdNumber = String

lcdDigits :: Int -> [LcdDigit]

lcdDigits n = map lcdDigit (map (\c -> ord c - ord '0') (show n))
            
lcdNumber :: Int -> LcdNumber
lcdNumber n = lcdDigits n & concatDigits & unlines

concatDigits :: [LcdDigit] -> [String]
concatDigits [a] = a
concatDigits (d:ds) = zipWith (++) d (concatDigits ds)

main :: IO ()
main = hspec $ do
    describe "lcdNumber" $ do
        it "one digit" $ do
            lcdNumber 0 `shouldBe`
                " _ \n" ++
                "| |\n" ++
                "|_|\n"
            lcdNumber 1 `shouldBe`
                "   \n" ++
                "  |\n" ++
                "  |\n"
            lcdNumber 2 `shouldBe`
                " _ \n" ++
                " _|\n" ++
                "|_ \n"
            lcdNumber 3 `shouldBe`
                " _ \n" ++
                " _|\n" ++
                " _|\n"
            lcdNumber 4 `shouldBe`
                "   \n" ++
                "|_|\n" ++
                "  |\n"
            lcdNumber 5 `shouldBe`
                " _ \n" ++
                "|_ \n" ++
                " _|\n"
            lcdNumber 6 `shouldBe`
                " _ \n" ++
                "|_ \n" ++
                "|_|\n"
            lcdNumber 7 `shouldBe`
                " _ \n" ++
                "  |\n" ++
                "  |\n"
            lcdNumber 8 `shouldBe`
                " _ \n" ++
                "|_|\n" ++
                "|_|\n"
            lcdNumber 9 `shouldBe`
                " _ \n" ++
                "|_|\n" ++
                " _|\n"
        it "two digits" $ do
            lcdNumber 10 `shouldBe`
                "    _ \n" ++
                "  || |\n" ++
                "  ||_|\n"
            lcdNumber 11 `shouldBe`
                "      \n" ++
                "  |  |\n" ++
                "  |  |\n"
        it "three digits" $ do
            lcdNumber 123 `shouldBe`
                "    _  _ \n" ++
                "  | _| _|\n" ++
                "  ||_  _|\n"
         
