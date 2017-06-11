with import (fetchTarball https://github.com/NixOS/nixpkgs/archive/763e21e982370f67c126f92a1113ea949db3b6e0.tar.gz) { };

let
  hsPkgs = haskell.packages.ghc802;
in
  haskell.lib.buildStackProject {
     name = "bronze-linker-client";
     ghc = hsPkgs.ghc;
     buildInputs = [
       git
     ] ++ (lib.optionals stdenv.isLinux [ cabal-install stack ]);
     LANG = "en_US.UTF-8";
  }
