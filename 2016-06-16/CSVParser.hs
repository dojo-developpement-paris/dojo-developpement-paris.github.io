module CSVParser
where 

import Data.Text (pack,splitOn,unpack)

type CSVTable = [String]
data CSVField = DoubleField Double 
              | StringField String
              deriving (Show,Eq,Read)

count :: CSVTable -> Int
count t = length t - 1

parse :: [String] -> CSVTable
parse = id

readCSV :: String -> IO [String]
readCSV = fmap lines . readFile

retrieve :: CSVTable -> String -> Int -> CSVField
retrieve t "prix" l =  DoubleField $ read $ fields ( t !! l ) !! (fieldNumber "prix")
retrieve t "libelle" l = StringField $ fields ( t !! l ) !! (fieldNumber "libelle")

fieldNumber "prix" = 2
fieldNumber "libelle" = 1

fields :: String -> [String]
fields = map unpack . splitOn (pack ";") . pack
