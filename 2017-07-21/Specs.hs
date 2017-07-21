import Test.Hspec
import Primes

main = hspec $ do
    describe "primes" $ do
        it "gives an infinite list of prime numbers" $ do
            head primes `shouldBe` 2 
            take 2 primes  `shouldBe` [2,3]
            take 3 primes  `shouldBe` [2,3,5] 
            primes !! 9 `shouldBe` 29
            primes !! 99 `shouldBe` 541
            primes !! 999 `shouldBe` 7919
            primes !! 29999 `shouldBe` 350377

    describe "multiples" $ do
        it "gives all the multiple of n from n*n" $ do
            take 5 (multiples 2) `shouldBe` [4,6,8,10,12]

    describe "merge" $ do
        it "merges two infinite ordered" $ do
            let even = [2,4..]
                odd  = [3,5..]
            take 1 (merge even odd) `shouldBe` [2]
            take 2 (merge even odd) `shouldBe` [2,3]
            take 3 (merge even odd) `shouldBe` [2,3,4]
            take 3 (merge even (tail even)) `shouldBe` [2,4,6]

    describe "union" $ do
        it "is a super merge" $ do
            let m2 = [4,6..]
                m3 = [9,12..]
                m5 = [25,30..]
            take 10 (union [m2,m3,m5]) `shouldBe` take 10 (merge m2 (merge m3 m5)) 

    describe "composites" $ do
        it "contains all the composite" $ do
            take 10 (composites) `shouldBe` [4,6,8,9,10,12,14,15,16,18]

    describe "minus" $ do
        it "gives one list minus the second list" $ do
            let even = [2,4..]
            take 4 ([1..] `minus` even) `shouldBe` [1,3,5,7]
