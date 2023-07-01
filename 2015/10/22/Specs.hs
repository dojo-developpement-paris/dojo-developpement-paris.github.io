import Test.Hspec
import Data.List (elemIndex)

digits :: Ocr
digits =
  [" _     _  _     _  _  _  _  _ "
  ,"| |  | _| _||_||_ |_   ||_||_|"
  ,"|_|  ||_  _|  | _||_|  ||_| _|"]


fortyNine =
  ["    _ "
  ,"|_||_|"
  ,"  | _|"]

extractBlock :: Int -> Ocr -> Ocr
extractBlock n o = map ((take 3).(drop (n*3))) o

one :: Ocr
one = extractBlock 1 digits

two :: Ocr
two = extractBlock 2 digits

nine :: Ocr
nine = extractBlock 9 digits

type Ocr = [String]
type AccountNumber = String

blocks :: Ocr -> [Ocr]
blocks o = map (flip extractBlock o) [0..n]
  where n = ((length (head o)) `div` 3) - 1

bankRead :: Ocr -> AccountNumber
bankRead o = foldr ((:) . readBlock) "" (blocks o)

readBlock :: Ocr -> Char
readBlock o = case elemIndex o (blocks digits) of
                  Nothing -> error "unknown block"
                  Just i  -> "0123456789" !! i

main = hspec $ do
  describe "bankRead" $ do
    it "should read the first digit" $ do
      bankRead one `shouldBe` "1"
    it "should read the digit 9" $ do
      bankRead nine `shouldBe` "9"
    it "should read a number" $ do
      bankRead fortyNine `shouldBe` "49"

