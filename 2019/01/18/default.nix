with import <nixos> {};
{
    rustEnv = stdenv.mkDerivation {
        name = "rust-sandbox";
        buildInputs = [
            rustup
            gcc-arm-embedded
        ];
        shellHook = ''
        export PATH=$PATH:~/.cargo/bin
        '';
    };
}
