{-# LANGUAGE FlexibleContexts #-}
import Test.Hspec
import Control.Monad.Writer
import Bowling

out = \s -> writer (0, s)
inp = return "0"

main = hspec $ do
    describe "the writer monad" $ do
        it "can be used to log 'output' " $ do
            execWriter (writer ((), "foo")) `shouldBe` "foo"
        
    describe "bowlingProcess" $ do
        describe "should print a score" $ do
            it "that is larger or equal to initial" $ do
                execWriter (bowlingProcess 0 inp out)  `shouldBe` "Score = 0"

                execWriter (bowlingProcess 42 inp out)  `shouldBe` "Score = 42"

        describe "should accept an input" $ do
            describe "which is used to compute the score" $ do
                it "in a simple throw" $ do
                    let inp = return "3"            
                    execWriter (bowlingProcess 0 inp out)  `shouldBe` "Score = 3"

        describe "should return the current score" $ do
            it "for example, 0 initially" $ do
                fst (runWriter(bowlingProcess 0 inp out))  `shouldBe` 0
    
            it "but also, when a throw was made" $ do
                let inp = return "7" 
                fst (runWriter(bowlingProcess 0 inp out))  `shouldBe` 7

                fst (runWriter(bowlingProcess 2 inp out))  `shouldBe` 9
    
    
    describe "process" $ do
        describe "should process every line" $ do
            it "for example at the beginning" $ do
                let inp = return "1"
                    end = \score -> score > 300
                fst (runWriter (process end 0 inp out)) `shouldBe` 6

