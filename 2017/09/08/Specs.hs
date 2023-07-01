import Test.Hspec
import Bank

main = hspec $ do
    let today = Date 2017 09 08
    let tomorrow = Date 2017 09 09
    let nextYear = Date 2018 01 01
    let acc = initial
    describe "an account" $ do
        it "is initially has a balance of 0" $ do
            balance acc today `shouldBe` (Money 0)
            balance' acc today  `shouldBe` (Money 0)

        it "can receive a deposit" $ do
            let acc'= deposit (Money 4807) today acc
            balance' acc' today  `shouldBe` (Money 4807) 

        it "can receive several deposits" $ do
            let acc' = deposit (Money 100) today acc
                acc''= deposit (Money 50)  today acc'
            balance' acc'' today  `shouldBe` Money 150 

        it "has a balance that depends on date" $ do
            let acc' = deposit (Money 100) today acc
                acc''= deposit (Money 50)  tomorrow acc'
                acc'''= deposit (Money 1000) nextYear acc''
            balance' acc'' today  `shouldBe` Money 100 
            balance' acc'' tomorrow  `shouldBe` Money 150
            balance' acc''' nextYear  `shouldBe` Money 1150
            balance' acc''' today  `shouldBe` Money 100

        it "allows for withdrawal" $ do
            let acc'= deposit (Money 4807) today acc
                acc''=withdraw (Money 807) tomorrow acc'
            balance' acc'' tomorrow `shouldBe` (Money 4000) 

