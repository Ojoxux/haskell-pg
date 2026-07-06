{
  description = "Haskell ENV";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        ghcForBook = pkgs.haskellPackages.ghcWithPackages (
          ps: with ps; [
            random
          ]
        );
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            cabal-install
            ghcForBook
            haskell-language-server
            nixd
          ];

          shellHook = ''
            echo "Haskell dev shell"
            echo "  ghci       # start the REPL"
            echo "  runghc examples/hello.hs"
            echo "  cabal --version"
            echo "  haskell-language-server-wrapper --version"
            echo "  nixd --version"
            echo ""
          '';
        };
      }
    );
}
