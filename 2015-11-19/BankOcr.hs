module BankOcr
where
import Data.Char (digitToInt)

type AccountNumber = String
type OCRdata = [String]

extractDigit :: OCRdata -> OCRdata
extractDigit  = map (take 3)

dropDigit :: OCRdata -> OCRdata
dropDigit = map (drop 3)

convert :: OCRdata -> AccountNumber
convert ["","",""] = ""
convert ocr = convertDigit (extractDigit ocr) : convert (dropDigit ocr)

convertDigit :: OCRdata -> Char
convertDigit [" _ "
             ,"| |"
             ,"|_|"] = '0'

convertDigit ["   "
             ,"  |"
             ,"  |"] = '1'

convertDigit [" _ "
             ," _|"
             ,"|_ "] = '2'

convertDigit [" _ "
             ," _|"
             ," _|"] = '3'

convertDigit ["   "
             ,"|_|"
             ,"  |"] = '4'

convertDigit [" _ "
             ,"|_ "
             ," _|"] = '5'

convertDigit [" _ "
             ,"|_ "
             ,"|_|"] = '6'

convertDigit [" _ "
             ,"  |"
             ,"  |"] = '7'

convertDigit [" _ "
             ,"|_|"
             ,"|_|"] = '8'

convertDigit [" _ "
             ,"|_|"
             ," _|"] = '9'

checksum :: AccountNumber -> Bool
checksum an = (sumFactors (integers an)) `mod` 11 == 0
    where
    integers = map digitToInt
    sumFactors = sum . zipWith (*) [9,8..1]

readOCR :: OCRdata -> [AccountNumber]
readOCR [] = []
readOCR (l1:l2:l3:ocr) = convert [l1,l2,l3] : readOCR ocr
