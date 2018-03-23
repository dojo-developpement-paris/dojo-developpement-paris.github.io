module Test_MineField where

import Test.HUnit
import MineField

it :: String -> (String ->  Test) -> Test
it message f = f message

shouldBe :: (Eq a, Show a) => a -> a -> (String -> Test)
shouldBe result expect = \message -> TestCase $ assertEqual message expect result

tests = TestList [
    it "when given a 1 cell mine field yields this field" $ 
        label ["*"] `shouldBe` ["*"]
   
   ,it "when given a 0 mine field, yields label 0" $
        label ["."] `shouldBe` ["0"]
   
   ,it "when given a 2 cell field with 1 mine, label this field" $
        label ["*."] `shouldBe`["*1"]         
 
   ,it "when given a 2 cell field with 1 mine, label this field" $
        label [".*"] `shouldBe`["1*"]         
   
   ,it "when given a 3 cell field with 1 mine, label this field" $
        label ["*.."] `shouldBe`["*10"]         

    ,it "when given a 3 cell field with 2 mines, label this field" $
        label ["**."] `shouldBe`["**1"]         

    ,it "when given a 3 cell field with 2 mines, label this field" $
        label [".**"] `shouldBe`["1**"]         

    ,it "when given a 3 cell field with 2 mines, label this field" $
        label ["*.*"] `shouldBe`["*2*"]         

    ,it "when given a 2 cell column with 1 mine, label this field" $
        label ["*"
              ,"."] `shouldBe`["*"
                              ,"1"]         
    ,it "when given a 2 cell column with 1 mine, label this field" $
        label ["."
              ,"*"] `shouldBe`["1"
                              ,"*"]
                              
    ,it "when given a 4 cells with 1 mine, label this field" $
        label [".."
              ,"*."] `shouldBe`["11"
                               ,"*1"]         
    ,it "when given a 4 cells with 1 mine, label this field" $
        label ["*."
              ,".."] `shouldBe`["*1"
                               ,"11"]         
    ,it "when given a 4 cells with 1 mine, label this field" $
        label [".*"
              ,".."] `shouldBe`["1*"
                               ,"11"]         
                                    
               
               ]
main = do runTestTT tests

