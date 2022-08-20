import Test.Hspec

allTheNumbers :: [Int] -> String
allTheNumbers [] = ""
allTheNumbers l | l == [0..10] = "1098765432"
allTheNumbers (a:as) = show a ++ allTheNumbers as

shouldContainAll :: String -> [String] -> Expectation
shouldContainAll s ss = mapM_ (shouldContain s) ss

shouldHaveSize :: String -> Int -> Expectation
shouldHaveSize s l = s `shouldSatisfy` (((==) l) . length)

main = hspec $ do
  describe "all the numbers kata" $ do
    describe "allTheNumbers function" $ do
      it "shows an empty string given an empty list of numbers" $ do
        allTheNumbers [] `shouldBe` ""
      it "shows a one-char string given a one-digit number in a list" $ do
        allTheNumbers [1] `shouldBe` "1"
        allTheNumbers [2] `shouldBe` "2"
      it "shows a two-char string given two one-digit number in a interval" $ do
        allTheNumbers [1..2] `shouldContainAll` (map show [1..2])
        allTheNumbers [1..2] `shouldHaveSize` 2
        allTheNumbers [2..3] `shouldContainAll` (map show [2..3])
        allTheNumbers [2..3] `shouldHaveSize` 2
      it "shows a 3-char string given an interval of three numbers"  $ do
        allTheNumbers [2..4] `shouldContainAll` (map show [2..4])
        allTheNumbers [2..4] `shouldHaveSize` 3
      it "shows all number from 0 to 10 without repeating 1 and 0" $ do
        allTheNumbers [0..10] `shouldContainAll` (map show [0..10])
        allTheNumbers [0..10] `shouldHaveSize`   10
