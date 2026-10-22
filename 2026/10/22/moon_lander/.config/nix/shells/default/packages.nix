{
  pkgs,
}:

[
  pkgs.rustup # to execute Rust using the right version
  pkgs.clang # to compile to binary
  pkgs.bacon # to re-execute tests when sources files change
  pkgs.mask # to execute commands in the maskfile.md
  pkgs.bashInteractive.out # to execute commands in the maskfile.md
  pkgs.git-gamble # to be able to gamble on the tests result
]
