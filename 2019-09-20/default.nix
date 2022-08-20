with import <nixpkgs> {};
let
  ghc = haskellPackages.ghcWithPackages (pkgs: with pkgs; [hspec]);
in
stdenv.mkDerivation {
    name = "haskell-sandbox";
    buildInputs = [
        ghc
    ];
}

