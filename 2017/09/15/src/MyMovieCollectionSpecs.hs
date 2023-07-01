import Test.Hspec
import Data.List

data Movie = Movie {
    title :: String,
    year :: Int
} deriving (Show, Eq)

matches query = isInfixOf query . title

findByTitle = filter . matches

main = hspec $ do
    let movies = [ Movie {
            title= "The Matrix",
            year= 1999
        }, Movie {
            title= "A beautiful mind",
            year= 2001
        }, Movie {
            title= "Intouchable",
            year= 2011
        }, Movie {
            title= "Forest Gump",
            year= 1994
        }]
    
    describe "My movie collection search by name" $ do
        it "should return empty when none found" $ do
            findByTitle "Interstellar" movies `shouldBe` []
        it "should return movie if title matches" $ do
            findByTitle "The Matrix" movies `shouldBe` [ Movie {
                title= "The Matrix",
                year= 1999
            }]
        it "should return all movies that matches" $ do
            findByTitle "o" movies `shouldBe` [ Movie {
                    title= "Intouchable",
                    year= 2011
                }, Movie {
                    title= "Forest Gump",
                    year= 1994
                }]





