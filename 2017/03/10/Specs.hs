import Test.Hspec
import Nonogram

main = hspec $ do
    describe "a nonogram solver" $ do
        it "should solve an empty 1x1 grid" $ do
            solve [[]] [[]]  `shouldBe` [" "]

        it "should solve a full 1x1 grid" $ do
            solve [[1]] [[1]]  `shouldBe` ["#"]

        it "should solve an empty 2x1 grid" $ do
            solve [[],[]] [[]]  `shouldBe` ["  "]

        it "should solve a first column 2x1 grid" $ do
            solve [[1],[]] [[1]]  `shouldBe` ["# "]
            solve [[],[1]] [[1]]  `shouldBe` [" #"]
            solve [[1],[1]] [[2]]  `shouldBe` ["##"]

        it "should solve a first column 1x2 grid" $ do
            solve [[]] [[],[]]  `shouldBe` [" "
                                           ," "]
            solve [[1]] [[1],[]] `shouldBe` ["#"
                                            ," "]
            solve [[1]] [[],[1]] `shouldBe` [" "
                                            ,"#"]
            solve [[2]] [[1],[1]] `shouldBe` ["#"
                                             ,"#"]
        it "should solve a 2x2 grid" $ do
            solve [[],[]] [[],[]]  `shouldBe` ["  "
                                              ,"  "]
            solve [[1],[]] [[1],[]]  `shouldBe` ["# "
                                                ,"  "]
            solve [[2],[2]] [[2],[2]]  `shouldBe` ["##"
                                                  ,"##"]
            solve [[1],[2]] [[1],[2]]  `shouldBe` [" #"
                                                  ,"##"]

        
