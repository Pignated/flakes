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
        pythonBase= pkgs.callPackage "${monorepo}/python/default.nix" {};
        pythonEnv = 
                    (pkgs.python3.withPackages (ps: with ps;
            (pythonBase.packages ps) ++ [
                    #add additional packages here
            ]));
      in
      {
        devShells.default = pkgs.mkShell {
            inherit (pythonBase) env;
            packages = [pythonEnv
                        pkgs.basedpyright];
            shellHook = pythonBase.shellHook;
        };
      });
}
