{
  description = "A basic Python development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        # This imports the default.nix that is already in this folder
        pythonShell = pkgs.callPackage ./default.nix {};
      in
      {
        devShells.default = pythonShell;
      });
}
