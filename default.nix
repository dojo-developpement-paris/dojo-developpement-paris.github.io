with import <nixpkgs> {};
stdenv.mkDerivation {
    name = "java-sandbox";
    buildInputs = [
        pkgs.ghc
            pkgs.cabal-install
    ];
    buildPhase =''
        cabal update
        cabal install hspec
    '';
}

