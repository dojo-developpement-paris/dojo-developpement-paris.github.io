import Test.Hspec
import Data.List

type Counter = Int

isInteresting :: Counter -> Bool
isInteresting n = any ($ cs) predicates
  where cs = show n
        predicates = [isRepeating,
                     isGrowing,
                     isGrowing.reverse,
                     isPalindrome,
                     isAlternating]

isRepeating :: String -> Bool
isRepeating cs = length (nub cs) == 1

isGrowing :: String -> Bool
isGrowing cs = all hasSuccessor $ zip cs $ tail cs
  where hasSuccessor (c, c') = succ c == c'

isPalindrome :: String -> Bool
isPalindrome n = n == reverse n

isAlternating :: String -> Bool
isAlternating cs = length cs > 2 && length (nub sums) == 1
  where ns = map (read.(:"")) cs :: [Int]
        sums = zipWith (+) ns (tail ns)

main = hspec $ do
  describe "isInteresting" $ do
    it "recognizes that 13471 is not interesting" $ do
      isInteresting 13471 `shouldBe` False
    it "recognizes that 11113 is not interesting" $ do
      isInteresting 11113 `shouldBe` False
    it "recognizes that 14 is not interesting" $ do
      isInteresting 14 `shouldBe` False
    it "recognizes that 1111 is interesting" $ do
      isInteresting 1111 `shouldBe` True
    it "recognizes that 222 is interesting" $ do
      isInteresting 222 `shouldBe` True
    it "recognizes that 123 is interesting" $ do
      isInteresting 123 `shouldBe` True
    it "recognizes that 54321 is interesting" $ do
      isInteresting 54321 `shouldBe` True
    it "recognizes that 17071 is interesting" $ do
      isInteresting 17071 `shouldBe` True
    it "recognizes that 125521 is interesting" $ do
      isInteresting 125521 `shouldBe` True
    it "recognizes that 2525 is interesting" $ do
      isInteresting 2525 `shouldBe` True
    it "recognizes that 5353 is interesting" $ do
      isInteresting 5353 `shouldBe` True
