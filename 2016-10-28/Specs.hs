import Test.Hspec
import Test.QuickCheck
import QuatreLAJackie


spec = hspec $ do
    describe "the Jackie 4L odometer detector" $ do
        it "should find any repetition of a digit interesting" $ do
            interesting "111111" `shouldBe` True 
            interesting "222222" `shouldBe` True 
            interesting "222"    `shouldBe` True 

        it "should not find interesting things such as:" $ do
            interesting "126411" `shouldBe` False 
            interesting "126412" `shouldBe` False 
            interesting "1"      `shouldBe` False 
            interesting "11"     `shouldBe` False 

        it "should find interesting consecutive numbers" $ do
            interesting "234567"  `shouldBe`  True
            interesting "345678"  `shouldBe`  True

        it "should find interesting up and downs" $ do
            interesting "123321"  `shouldBe` True
            interesting "234432"  `shouldBe` True
            interesting "234543"  `shouldBe` False
            interesting "264462"  `shouldBe` False
            interesting "12321"   `shouldBe` True

    describe "soon" $ do
        it "should tell if we are close to interesting pattern" $ do
           soon 8 "99991"  `shouldBe` True 
           soon 8 "99990"  `shouldBe` False 
           soon 9 "99990"  `shouldBe` True 
           soon 9 "99991"  `shouldBe` True 
           soon 1 "3455"  `shouldBe` True 
           soon 1 "345678"  `shouldBe` True 

    describe "how soon" $ do
        it "should tell how soon we are close to an interesting pattern" $ do
           howSoon "3455"  `shouldBe` 1 
           howSoon "3454"  `shouldBe` 2 
            

patterns = do
    n <- choose (3,6)
    d <- choose ('1','9') 
    return $ replicate n d

ascendings = do
    n <- choose (3,6)
    start <- choose ('1','4')
    return $ take n [start, succ start..]

garbageLen2 = do
    n <- choose (1,2)
    d <- choose ('1','9')
    e <- choose ('1','9')
    return $ take n [d,e]


repetition3to6AreInteresting = forAll patterns interesting

ascending3to6AreInteresting  = forAll ascendings interesting

garbageLen2IsNotInteresting  = forAll garbageLen2  $ not . interesting

main = do
    spec
    quickCheck repetition3to6AreInteresting
    quickCheck ascending3to6AreInteresting
    quickCheck garbageLen2IsNotInteresting


