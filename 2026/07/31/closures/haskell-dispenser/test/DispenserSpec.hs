module DispenserSpec (spec)
    where

import Dispenser
import Test.Hspec
import Data.Maybe

spec :: SpecWith ()
spec = do
    describe "Dispenser" $ do
        let dispenser = makeDispenser [23, 17, 42, 4807, 3, 12, 256, 100, 1017, 5]

        it "can find the first and next items matching a predicate" $ do
            let (result, newDispenser) = findFirst dispenser (\n -> n > 100)
            result `shouldBe` Just 4807
            let (newResult, newNewDispenser) = findNext newDispenser
            newResult `shouldBe` Just 256
            let (newNewResult, newNewNewDispenser) = findNext newNewDispenser
            newNewResult `shouldBe` Just 1017
            let (newNewNewResult, _) = findNext newNewNewDispenser
            newNewNewResult `shouldBe` Nothing

        let iterateNext = iterate (findNext . snd)
        let results = catMaybes . takeWhile isJust . map fst
        it "can find the first and next items matching any predicate" $ do
            let r1 = results $ iterateNext $ findFirst dispenser even
            r1 `shouldBe` [42, 12, 256, 100]
            let r2 = results $ iterateNext $ findFirst dispenser ((0 ==) . (`mod` 3))
            r2 `shouldBe` [42,3,12,1017]

