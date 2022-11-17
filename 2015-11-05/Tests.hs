import Test.QuickCheck

take5 :: [a] -> [a]
take5 x = take 5 x

newtype ListGT5 = ListGT5 [Integer] deriving (Eq, Show) 

instance Arbitrary ListGT5 where
    arbitrary = do n <- choose (5,10)
                   return (ListGT5 (replicate n 1))

take5givesOnly5 :: ListGT5 -> Bool
take5givesOnly5 (ListGT5 xs) = length (take5 xs) == 5

newtype TestAccountOCR = TestAccountOCR [String] deriving (Eq,Show)


ocrChar = oneof [return '|', return '_', return ' ']


digits = choose ('0','9')

encodeDigit :: Char -> [String]

instance Arbitrary TestAccountOCR where
    arbitrary = do l1 <- sequence [digits | _ <- [1..9]]
                   l2 <- sequence [ocrChar | _ <- [1..9]]
                   l3 <- sequence [ocrChar | _ <- [1..9]]
                   return (TestAccountOCR [l1,l2,l3])


propDummy :: TestAccountOCR -> Bool
propDummy (TestAccountOCR s) = s == ["1","1","1"]

main = quickCheck $ forAll arbitrary propDummy

 
