{
  description = "A basic Python development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    monorepo.url = "github:pignated/flakes";
  };

  # The 'outputs' must be a function that returns an attribute set
  outputs = { self, nixpkgs, flake-utils, monorepo }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        
        # Import the monorepo logic
        pythonBase = import "${monorepo}/python/default.nix" { inherit pkgs; };
        
        # Build the environment by calling the library function from the monorepo
        pythonEnv = pkgs.python3.withPackages (ps: 
          (pythonBase.pythonLibraries ps) ++ (with ps;[
            # ps.requests  <-- Add extra libs here
          ]
        ));
      in
      {
        devShells.default = pkgs.mkShell {
          # Spread the environment variables so mkShell sees them
          inherit (pythonBase.env) USING_PYTHON;
          inherit (pythonBase) shellHook;

          packages = [
            pythonEnv
            pkgs.basedpyright
          ];
        };
      });
}

