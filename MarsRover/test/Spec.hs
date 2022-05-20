import Test.Hspec
import Lib

main :: IO ()
main = test

test = hspec $ do

    describe "a rover" $ do
        let roro  = Rover (0,0) North

        it "given an empty list of commands, stays put" $ do
            execute roro [] `shouldBe` roro
    
        it "given a forward command change position" $ do
            execute roro [Forward] `shouldBe` Rover (0,1) North

        it "given two forward command moves twice" $ do
            execute roro [Forward,Forward] `shouldBe` 
                Rover (0,2) North
