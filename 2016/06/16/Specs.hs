import Test.Hspec
import CSVParser

csv = ["id;libelle;prix",
           "4087;pomme;0.35",
           "42;banane des champs;1.97",
           "100;poire;2.60"]

main = hspec $ do
    describe "parser" $ do
        describe "count lines in CSV file" $ do
            it "should count 3 lines on a 4 lines CSV" $ do
                let table = parse csv
                count table `shouldBe` 3
            it "should count 2 lines on a 3 lines CSV" $ do
                let csv = ["id;libelle;prix",
                           "4087;pomme;0.35",
                           "100;poire;2.60"]
                    table = parse csv
                count table `shouldBe` 2
        describe "reader" $ do
            it "should read a CSV file" $ do
                csv <- readCSV "catalogue.csv"
                csv `shouldBe` ["id;libelle;prix",
                                "4087;pomme;0.35",
                                "42;banane des champs;1.97",
                                "100;poire;2.60"]
        describe "retrieve" $ do
            let table = parse csv
            it "should retrieve the price on a given line" $ do
                retrieve table "prix" 1 `shouldBe` DoubleField 0.35
                retrieve table "prix" 2 `shouldBe` DoubleField 1.97
            it "should retrieve the label on a given line" $ do
                retrieve table "libelle" 1 `shouldBe` StringField "pomme"
