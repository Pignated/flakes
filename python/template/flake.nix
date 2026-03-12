{
  description = "A basic Python development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    monorepo.url = "github:pignated/flakes";
  };

  outputs = { self, nixpkgs, flake-utils, monorepo }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        # This imports the default.nix that is already in this folder
        baseShell = monorepo.devShells.x86_64-linux.python;
        pythonShell = pkgs.python3.withPackages (ps: with ps; [
            #add additional packages here
            (import (monorepo + "/python/default.nix") { inherit pkgs; }).buildInputs
        ]);
      in
      {
        devShells.default = pkgs.mkShell {
            inputsFrom = [baseShell];
            packages = [pythonShell];
        };
      });
}
