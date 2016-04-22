-- Specs.hs
import Test.Hspec
import Test.QuickCheck
import RomanNumbers (Arabic, Roman, arabic, toRoman, toArabic, fromArabic, fromRoman, roman)

-- type driven : type must have a meaning in the domain (e.g. <> String)
-- property driven: properties are tested as invariant 
-- unit test driven: add unit test after types and properties

instance Arbitrary Roman
    where
    arbitrary = do s <- arbitrary
                   return (roman s) 

instance Arbitrary Arabic
    where
    arbitrary = do i <- arbitrary
                   return (arabic (abs i + 1)) 

symmetryRomanToArabic :: Roman -> Bool
symmetryRomanToArabic rn = toRoman (toArabic rn) == rn 

symmetryArabicToRoman:: Arabic -> Bool
symmetryArabicToRoman an = toArabic (toRoman an) == an 

arabicValueIsAlwaysPositive :: Arabic -> Bool
arabicValueIsAlwaysPositive an = fromArabic an > 0 

romanValueContainsOnlyIVXLCDM :: Roman -> Bool
romanValueContainsOnlyIVXLCDM rn = all (`elem` "IVXLCDM") (fromRoman rn)

main = do 
        -- quickCheck symmetryRomanToArabic 
        -- quickCheck symmetryArabicToRoman
        quickCheck arabicValueIsAlwaysPositive
        quickCheck romanValueContainsOnlyIVXLCDM


