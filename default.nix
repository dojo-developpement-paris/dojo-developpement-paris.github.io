with import <nixpkgs> {};
{
    javaEnv = stdenv.mkDerivation {
        name = "java-sandbox";
        buildInputs = [
            pkgs.nodejs
            pkgs.elmPackages.elm
        ];
    };
}
