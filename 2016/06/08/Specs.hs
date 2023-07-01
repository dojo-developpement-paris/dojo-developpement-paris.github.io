import Test.Hspec
import TableParser

main = hspec $ do
    describe "a parser" $ do
        it "should return an empty table when given an empty string" $ do
            parse ""  `shouldBe` "<table></table>"

        it "should parse a one row, one cell table" $ do
            parse "|content|"  `shouldBe` 
                "<table><TR><TD>content</TD></TR></table>"
            parse "|any|"  `shouldBe` 
                "<table><TR><TD>any</TD></TR></table>"

        it "should parse several cells in a row" $ do
            parse "|one|two|"  `shouldBe` 
                wrap "table" "<TR><TD>one</TD><TD>two</TD></TR>"

        it "should parse several rows" $ do
            parse "|one|\n|two|"  `shouldBe` 
                "<table><TR><TD>one</TD></TR><TR><TD>two</TD></TR></table>"
            parse "|one|\n|two|\n|a|b|"  `shouldBe` 
                "<table><TR><TD>one</TD></TR><TR><TD>two</TD></TR><TR><TD>a</TD><TD>b</TD></TR></table>"
