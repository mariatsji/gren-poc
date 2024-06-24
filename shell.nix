let
  nixpkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz";
  }) { };

  gren = nixpkgs.haskellPackages.callCabal2nix "gren" ((builtins.fetchGit {
      name = "gren";
      url = "https://github.com/gren-lang/compiler";
      rev = "397747d1564e994a6f90c8fc3c7ed045510b9fcd";
      allRefs = true;
      shallow = false;
    })) {};

in nixpkgs.mkShell {
  name = "gren-poc";
  buildInputs = with nixpkgs; [ cabal-install ghc gren ];
}
