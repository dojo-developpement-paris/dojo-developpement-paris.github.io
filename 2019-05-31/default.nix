with import <nixpkgs> {};
{
    javaEnv = stdenv.mkDerivation {
        name = "kotlin-sandbox";
        buildInputs = [
                pkgs.openjdk11
                pkgs.maven
                pkgs.gradle
                pkgs.kotlin
        ];
    };
}
