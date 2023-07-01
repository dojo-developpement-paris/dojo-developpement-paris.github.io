with import <nixpkgs> {};
let
  ghc = haskellPackages.ghcWithPackages (pkgs: with pkgs; [hspec]);
  tcrdd = callPackage (fetchFromGitHub {
    owner = "FaustXVI";
    repo = "tcrdd";
    rev= "ff6a498a92462df8c903625919a5a56325862d24";
    sha256 = "0y5lmfld3wxpm7maqxl1k9an237gin939z2bfwmbkbcx9flgkrzg";
  }) {};
in
stdenv.mkDerivation {
    name = "haskell-sandbox";
    buildInputs = [
        ghc
        tcrdd
    ];
}
