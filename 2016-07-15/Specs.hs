import Test.Hspec
import Carpaccio

main  = hspec $ do
    describe "times" $ do
        it "multiplies a quantity by a price" $ do
            42 `times` 10 `shouldBe` 420
            23 `times` 5  `shouldBe` 115

    describe "discount" $ do
        let discount' n = rounded (discount n)
        it "applies a discount according to amount" $ do
            discount' 100 `shouldBe` 0
            discount' 1000 `shouldBe` 30
            discount' 2000 `shouldBe` 60
            discount' 5000 `shouldBe` 250
            discount' 6000 `shouldBe` 300
            discount' 7000 `shouldBe` 490
            discount' 10000  `shouldBe` 1000
            discount' 50000  `shouldBe` 7500

    describe "taxRate" $ do
        it "applies a tax according to state code" $ do
            taxRate "UT"  `shouldBe` 6.85 
            taxRate "NV"  `shouldBe` 8.00 
            taxRate "TX"  `shouldBe` 6.25
            taxRate "AL"  `shouldBe` 4.00
            taxRate "CA"  `shouldBe` 8.25

    describe "withDiscount" $ do
        it "applies a discount to an amount of money" $ do
            withDiscount 10000 `shouldBe` 9000

    describe "taxIncluded" $ do
        it "applies a tax rate to an amount according to a state code" $ do
            taxIncluded "CA" 10000  `shouldBe` 10825.00  
            taxIncluded "CA" 2  `shouldBe` 2 * 1.0825  

    describe "total" $ do
        it "calculates total according to quantity, price, state code" $ do
            total 2 5000 "CA" `shouldBe` 9742.50 
            total 1 2    "CA" `shouldBe` 2.17
            
