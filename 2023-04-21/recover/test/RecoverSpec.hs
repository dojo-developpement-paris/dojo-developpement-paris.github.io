module RecoverSpec where
import Test.Hspec

import Data.List (delete, nub, sort)

recover :: [String] -> String
recover [] = []
recover triplets = first : recover nextTriplets
  where
    nextTriplets = nonEmpty (remove first triplets)
    nonEmpty = filter (not . null)
    remove c triplets = map (delete c) triplets
    heads = nub $ [head t | t <- triplets]
    tails = nub $ concat $ [tail t | t <- triplets]
    first = head [ c | c <- heads, not (c `elem` tails)]

secret = "whatisup"
triplets = ["tup"
           ,"whi"
           ,"tsu"
           ,"ats"
           ,"hap"
           ,"tis"
           ,"whs"
           ]

-- find a letter beginning a triplet which is not in the tail of  any triplet
-- ["tup" ,"whi" ,"tsu" ,"ats" ,"hap" ,"tis" ,"whs" ] ⇒ w
-- ["tup", "hi", "tsu", "ats", "hap" , "tis", "hs"] ⇒ h
-- ["tup", "i", "tsu", "ats", "ap" , "tis", "s"] ⇒ a
-- ["tup", "i", "tsu", "ts", "p" , "tis", "s"] ⇒ t
-- ["up", "i", "su", "s", "p" , "is", "s"] ⇒ i
-- ["up", "su", "s", "p" , "s", "s"] ⇒ s
-- ["up", "u", "p" ] ⇒ u
-- ["p",  "p" ] ⇒ p
-- [] ⇒ 
spec :: SpecWith ()
spec = do
  describe "recover" $ do
    it "when given one triplet, this is the secret" $ do
      recover ["abc"] `shouldBe` "abc"
      recover ["cde"] `shouldBe` "cde"

    it "when given two consecutive triplets, the outer letters are on each side of the common letters" $ do
      recover ["abc", "bcd"] `shouldBe` "abcd"
      recover ["bcd", "cde"] `shouldBe` "bcde"
      recover ["cde", "bcd"] `shouldBe` "bcde"

    it "when given two triplets with only 1 common letter, finds the secret" $ do
      recover ["abc", "cde"] `shouldBe` "abcde"

    it "passes the acceptance test" $ do
      recover triplets `shouldBe` secret

