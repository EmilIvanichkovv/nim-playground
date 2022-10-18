{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    buildInputs = [
      nix-prefetch-git
      figlet

      nim
    ];

    shellHook = ''
      figlet "Nim Playground in NIX"
    '';
  }
