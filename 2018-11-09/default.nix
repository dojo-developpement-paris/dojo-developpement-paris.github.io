with import <nixpkgs> {};
{
    rustEnv = stdenv.mkDerivation {
        name = "rust-sandbox";
        buildInputs = [
            rustup
        ];
    };
}
