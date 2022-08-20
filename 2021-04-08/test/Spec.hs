import Test.Hspec
import Data.Char (ord)

{-
phrase a encoder :
<- souventpoursamuserleshommesdequipage
-> PBGPXUGXSIAVRDHGMFXYCBRBFTRPRZLVEVOM
Rotors utilisé : I, II, III
Sélection du réflecteur à utiliser (Umkehrwalze) : B
Positions initiale des rotors (1 par rotor) (Grundstellung) : A, B, C
Positions de la roue alphabet (1 par rotor) (Ringstellung) : A, A, A
Tableau de connexions (Steckerverbindungen) : A-B, C-D
 - -}

-- Each rotor is a fixed wiring permutation within a cylinder ("the rotor").
-- The rotor entry points and exits are named using letters.
type Rotor = String
type RotorPosition = Char
-- The fixed exits for entries A-Z for each rotor is the following:
rotorI   = "WTOKASUYVRBXJHQCPZEFMDINLG"
rotorII  = "GJLPUBSWEMCTQVHXAOFZDRKYNI"
rotorIII = "JWFMHNBPUSDYTIXVZGRQLAOEKC"

-- The reflector is a fixed wiring permutation at the end of the line of rotors.
-- It returns the electric current back into the rotor that passed the current.
type Reflector = String
-- The fixed exits for entries A-Z for the reflector is the following:
reflectorB :: Reflector
reflectorB = "YRUHQSLDPXNGOKMIEBFZCWVJAT"

main = hspec $ do
  describe "enigma" $ do
    describe "the reflector" $ do
      it "is symetric" $ do
        reflect reflectorB 'A' `shouldBe` 'Y'
        reflect reflectorB 'Y' `shouldBe` 'A'
        (reflect reflectorB . reflect reflectorB) 'A' `shouldBe` 'A'
    describe "the rotor" $ do
      it "doesn't move for now" $ do
        use rotorI 'A' 'W' `shouldBe` 'I'
        use rotorI 'A' 'A' `shouldBe` 'W'
        use rotorI 'B' 'A' `shouldBe` 'T'
        use rotorI 'B' 'Z' `shouldBe` 'W'
    describe "the encryption function" $ do
      it "can encrypt strings with the reflector only" $ do
        encrypt "TUTU" `shouldBe` "ZCZC"
        encrypt "ZCZC" `shouldBe` "TUTU"
      
encrypt :: String -> String
encrypt = map (reflect reflectorB)

reflect :: Reflector -> Char -> Char
reflect reflector letter = reflector !! pos letter

use :: Rotor -> RotorPosition -> Char -> Char
use rotor position letter = rotor !! ((pos letter + pos position) `mod` length rotor)


pos letter = ord letter - ord 'A'
