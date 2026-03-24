module BankSpec where
    
import Test.Hspec
import Bank

newtype Mock a = Mock {
    runMock :: ([String], a)
}

instance Functor Mock where
    fmap f (Mock (log, a)) = Mock (log, f a)

instance Applicative Mock where
    pure a = Mock ([], a)
    Mock (l1, f) <*> Mock (l2, a) = Mock (l1 ++ l2, f a)

instance Monad Mock where
    Mock (l1, a) >>= f = 
        let Mock (l2, b) = f a 
        in Mock (l1 ++ l2, b)

instance Output Mock where
    outputStrLn s = Mock (["*:"++s], ())

spec :: SpecWith () 
spec = do 
    describe "Side effect" $ do
        it "should be testable" $ do
            let writeNumber x = outputStrLn (show x)
            let result = runMock (writeNumber 4807) 
            fst result `shouldBe` ["*:4807"]
    
    describe "Bank" $ do
        it "Deposit and print statement" $ do
            let b = newBank
            let result = runMock (balance (deposit "2026/03/24" 1000 b))
            fst result `shouldBe` ["*:2026/03/24 1000"]