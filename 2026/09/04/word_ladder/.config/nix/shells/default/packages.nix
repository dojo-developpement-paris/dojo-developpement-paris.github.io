{
  pkgs,
}:

[
  pkgs.nodejs-slim.out # to execute JavaScript
  pkgs.corepack # to get PNPM the package manager
  pkgs.oxlint # formatter for TypeScript
  pkgs.mask # to execute commands in the maskfile.md
  pkgs.bashInteractive.out # to execute commands in the maskfile.md
  pkgs.git-gamble # to be able to gamble on the tests result
]
