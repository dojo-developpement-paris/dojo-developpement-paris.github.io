import Test.QuickCheck
import Test.Hspec
import Bowling

data HalfSpare = HalfSpare Int
    deriving (Show)

data Spare = Spare Int Int
    deriving (Show)
    
instance Arbitrary HalfSpare where
    arbitrary = do
        e <- elements [0..9]
        return $ HalfSpare e

instance Arbitrary Spare where
    arbitrary = do
        e <- elements [0..9]
        return $ Spare e (10-e)


main = hspec $ do
    describe "addScore" $ do
        context "for normal throws" $ do
            it "should add throws to score" $ property $ do
                \sc (HalfSpare t) -> score (addScore (sc,0, Nothing) t) == sc + t
                \sc (HalfSpare t) -> score (addScore (sc,0, Nothing) t) >= sc

        context "for spares" $ do
            it "should include next throw as a bonus" $ property $ do
                    \(HalfSpare th) (HalfSpare next) -> 
                        let th' = 10 - th
                            st   = addScore initial th
                            st'  = addScore st th'
                            st'' = addScore st' next
                        in (score st'') `shouldBe` 10 + 2 * next 

            it "should add bonues for every spare" $ property $ do
                     \(Spare t t') (Spare u u') th ->
                         let st     = addScore initial t
                             st'    = addScore st t'
                             st''   = addScore st' u
                             st'''  = addScore st'' u'
                             st'''' = addScore st''' th
                         in (score st'''')  `shouldBe` 10 + 10 + th + ( u + th )
                 
        
                      


