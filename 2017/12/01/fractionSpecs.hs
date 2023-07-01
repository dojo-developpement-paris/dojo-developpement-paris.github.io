import Test.Hspec

data Frac = Frac Int Int
          | Entier Int
    deriving (Show,Eq)

a // b = Frac a b

add (Frac a b) (Frac c d) = normalize (Frac (c*b+a*d) (b*d))
add a b = (denormalize a) `add` (denormalize b)

normalize (Frac a b) | denominateur == 1 = Entier (a `div` myGcd)
                     | otherwise = Frac (a `div` myGcd) denominateur
    where myGcd =  gcd a b
          denominateur = div b myGcd

denormalize (Entier a) = Frac a 1
denormalize x          = x

main = hspec $ do
  describe "fractional addition" $ do
   it "should add two simple fractions" $ do
     ((1//3) `add` (1//3)) `shouldBe` (2//3)
     ((1//5) `add` (2//5)) `shouldBe` (3//5)
     ((1//3) `add` (1//5)) `shouldBe` (8//15)
     ((1//2) `add` (1//3)) `shouldBe` (5//6)
     ((1//4) `add` (1//4)) `shouldBe` (1//2)
     ((1//2) `add` (1//2)) `shouldBe` (Entier 1)
     ((Entier 1) `add` (1//2)) `shouldBe` (3//2)
     ((1//2) `add` (Entier 1)) `shouldBe` (3//2)
     ((Entier 2) `add` (Entier 3)) `shouldBe` (Entier 5)
     ((1000//1500) `add` (3000//2400)) `shouldBe` (23//12)
  describe "normalisation" $ do
    it "should normalize fraction" $ do
     normalize (2//4) `shouldBe` (1//2)
     normalize (2//8) `shouldBe` (1//4)
     normalize (3//9) `shouldBe` (1//3)
