import Test.Hspec


main = hspec $ do
    describe "total" $ do
        it "should multiply a quantity by an item price, given an item code" $ do
            (total (findPrice table "APPLE") (readQuantity "1")) `shouldBe`   Found 1.20
            (total (findPrice table "APPLE") (readQuantity "2")) `shouldBe`   Found 2.40
            (total (findPrice table "BANANA") (readQuantity "10")) `shouldBe`   Found 19.0
        it "should be okay to search for an unknown item" $ do
            (total (findPrice table "PEACH") (readQuantity "1"))  `shouldBe`    NotFound
        it "should be okay to enter a bad quantity" $ do
            (total (findPrice table "APPLE") (readQuantity "foo")) `shouldBe`   NotFound
    
    describe "withTax" $ do
        it "should multiply and apply a tax of 1.32" $ do
            
            (withTax (findPrice table "APPLE") (readQuantity "1")) `shouldBe`   Found (1.20 * 1.32)
    describe "findPrice" $ do

        it "should find the price given an item code and a table" $ do
            (findPrice table "APPLE" ) `shouldBe`   Found 1.20
            (findPrice table "BANANA") `shouldBe`   Found 1.90
        it "should be okay to search for an unknown item" $ do
            (findPrice table "PEACH")  `shouldBe`    NotFound

    describe "readQuantity" $ do
        it "should convert a String into a Quantity" $ do
            readQuantity "42" `shouldBe` Value 42
            readQuantity "17" `shouldBe` Value 17
        it "should be okay to enter a bad quantity" $ do
            readQuantity "foo"  `shouldBe` NoValue

type Reference = (Code, Price)
type Code      = String
type Price     = Double
type Quantity  = Double

data Result a = NotFound 
              | Found a
    deriving (Show, Eq)

instance Functor (Result)
    where
    fmap f (NotFound) = NotFound
    fmap f (Found r)  = Found (f r)

data Value = NoValue
           | Value Double
    deriving (Show, Eq)

table :: [Reference]
table = [("APPLE", 1.20), ("BANANA",1.90)]

total :: Result Price -> Value -> Result Price
total r v = mapCalc (*) r v

withTax :: Result Price -> Value -> Result Price
withTax = mapCalc (\p q -> p * q * 1.32)

mapCalc :: (Double -> Double -> Double) -> Result Price -> Value -> Result Price
mapCalc f (Found p) (Value q) = Found (f p q)
mapCalc _ NotFound  _         = NotFound
mapCalc _ _         NoValue   = NotFound


findPrice :: [Reference] -> Code -> Result Price
findPrice ((ref,pr):xs) sought  | sought == ref  = Found pr
                                | otherwise      = findPrice xs sought 
findPrice [] _ = NotFound

readQuantity :: String -> Value
readQuantity s = case reads s of
    [(q,_)] -> Value q
    []      -> NoValue
