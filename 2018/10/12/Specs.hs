import Test.Hspec
import Test.QuickCheck
import Prelude hiding ((/))

data Frac = Frac Integer Integer
    deriving (Show, Eq)

a / b = simplify $ Frac a b
        where
              simplify (Frac n d) | d < 0 = simplify $ Frac (n*d) (d*d)
              simplify (Frac 0 _) = Frac 0 1
              simplify (Frac n d) = Frac (n `div` g) (d `div` g)
                    where g = gcd n d

instance Num Frac where
    (Frac a d) + (Frac b c) | d == c =  (a+b) / d
                            | otherwise = ((a * c) + (b * d)) / (c * d)
    a * b = a
    abs a = a
    signum a = 1
    fromInteger a = Frac a 1
    negate a = a

main = do 
    hspec $ do
        describe "fractional adder" $ do
            it "should add integers" $ do
                (fromInteger 0) + (fromInteger 0) `shouldBe` (fromInteger 0)
                (fromInteger 0) + (fromInteger 1) `shouldBe` (fromInteger 1)
                (fromInteger 1) + (fromInteger 0) `shouldBe` (fromInteger 1)

            it "should add fractions with same denominators" $ do
                (1 / 5) + (1 / 5) `shouldBe` (2 / 5)
                (1 / 5) + (2 / 5) `shouldBe` (3 / 5)
                (1 / 7) + (1 / 7) `shouldBe` (2 / 7)
                (2 / (-1)) + (3 / (-1)) `shouldBe` ((-5) / 1)
                (0 / (-1)) + (0 / (-1)) `shouldBe` (0 / 1)
                (0 / (-38)) + (1 / (-38)) `shouldBe` ((-1) / 38)
                ((-1) / (-1)) + ((-1) / (-1)) `shouldBe` (2 / 1)
                (1 / (-1)) + (1 / (-1)) `shouldBe` ((-2) / 1)

            it "should add fractions with distinct denominators" $ do
                (1 / 7) + (1 / 5) `shouldBe` (12 / 35)
            it "should add fractions with same denominators and simplify" $ do
                (1 / 2) + (3 / 2) `shouldBe` (2 / 1)
                (1 / 4) + (3 / 4) `shouldBe` (1 / 1)
                (1 / 4) + (3 / 4) `shouldBe` (1 / 1)
                (3 / 4) + (3 / 4) `shouldBe` (3 / 2)
                (5 / 4) + (5 / 4) `shouldBe` (5 / 2)
                (13 / 6) + (2 / 6) `shouldBe` (5 / 2)
                (3 / 5) + (4 / 15) `shouldBe` (13 / 15)  
            it "should simplify" $ do
                (4 / (-2)) `shouldBe` ((-2) / 1) 
      
    quickCheck eval

eval a b c d | b == 0 || d == 0 = True 
             | otherwise = (a / b) + (c / d) == ((a*d) / (b*d)) + ((c*b) / (d*b))
   
