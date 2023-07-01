import Test.Hspec
import Sokoban

main = hspec $ do
    describe "a puzzle" $ do
        let p = puzzle ["########"
                       ,"#. $ @ #"
                       ,"########"]
        let l = puzzle ["########"
                       ,"#. $@  #"
                       ,"########"]
        let q = puzzle ["######"
                       ,"#. $@#"
                       ,"#. $ #"
                       ,"######"]
        let r = puzzle ["######"
                       ,"#*@  #"
                       ,"######"]
        let s = puzzle ["######"
                       ,"#. $ #"
                       ,"#. $@#"
                       ,"######"]
        describe "game status functions" $ do
            it "has a list of goals" $ do
                goals p `shouldBe` 1
                goals q `shouldBe` 2
            it "has a list of crates" $ do
                crates p `shouldBe` 1
                crates q `shouldBe` 2
            it "is a success when no goal is left" $ do
                success p `shouldBe` False
                success q `shouldBe` False
                success r `shouldBe` True
        describe "game movements" $ do
            it "can move its worker" $ do
                move q Down  `shouldBe` s
                move s Up    `shouldBe` q
            it "can tell its workercoordinates" $ do
                workerCoord p `shouldBe` (1,5)
                workerCoord r `shouldBe` (1,2)
            it "cannot move its worker if there is a wall" $ do
                move p Up  `shouldBe` p
                move p Down `shouldBe` p
                move p Lt   `shouldBe` l
                move l Rt  `shouldBe` p
            it "can push crates" $ do
                let s = puzzle ["########"
                               ,"#.$@   #"
                               ,"########"]
                move l Lt `shouldBe` s
                
                

 
        describe "replace" $ do
            it "replaces an object in a row" $ do
                replace "# @#" 2 '*' `shouldBe` "# *#"
        describe "replaceObject" $ do
            it "replaces an object in a puzzle" $ do
                let t = puzzle ["########"
                               ,"#. $   #"
                               ,"########"]
                replaceObject p (1,5) ' ' `shouldBe` t
