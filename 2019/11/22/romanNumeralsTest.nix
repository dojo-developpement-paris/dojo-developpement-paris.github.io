with import ./nixUnit.nix;
with import ./romanNumerals.nix;

{
  "toRoman should" = {
    "convert arabic number to roman number" = map 
    (example: assertEquals (toRoman example.arabic) example.roman) [
      { arabic = 1; roman = "I";}
      { arabic = 5; roman = "V";}
      { arabic = 10; roman = "X";}
      { arabic = 2; roman = "II";}
      { arabic = 3; roman = "III";}
      { arabic = 6; roman = "VI";}
      { arabic = 7; roman = "VII";}
      { arabic = 11; roman = "XI";}
      { arabic = 16; roman = "XVI";}
      { arabic = 4; roman = "IV";}
      { arabic = 9; roman = "IX";}
      { arabic = 14; roman = "XIV";}
      { arabic = 34; roman = "XXXIV";}
      { arabic = 50; roman = "L";}
      { arabic = 100; roman = "C";}
      { arabic = 500; roman = "D";}
      { arabic = 1000; roman = "M";}
      { arabic = 40; roman = "XL";}
      { arabic = 400; roman = "CD";}
      { arabic = 90; roman = "XC";}
      { arabic = 900; roman = "CM";}
      { arabic = 49; roman = "XLIX";}
    ] ;
  };
}
