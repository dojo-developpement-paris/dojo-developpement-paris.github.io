with import <nixpkgs> {};
with lib;
with lib.strings;
with builtins;

let
  romanLiterals = {
    "1" = "I";
    "5" = "V";
    "10" = "X";
    "50" = "L";
    "100" = "C";
    "500" = "D";
    "1000" = "M";

    "4" = "IV";
    "40" = "XL";
    "400" = "CD";
    "9" = "IX";
    "90" = "XC";
    "900" = "CM";
  };
  arabicValues = sort (a: b: a > b) (map toInt (attrNames romanLiterals));
  closest = n: foldl' max 0 (filter (a: a < n) arabicValues);
in rec {
  toRoman = n: 
  let
    key = closest n;
  in
    if hasAttr (toString n) romanLiterals 
    then getAttr (toString n) romanLiterals
    else toRoman(key) + toRoman (n - key)
    ;
}
