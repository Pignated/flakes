{
    description = "Monorepo with multiple dev shells";
    inputs = {
        nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };
    outputs = { self, nixpkgs, flake-utils, ...}:
        flake-utils.lib.eachDefaultSystem (system: 
            let
                pkgs = nixpkgs.legacyPackages.${system};
            in
            {
                devShells.java = pkgs.callPackage ./java/default.nix {};
                devShells.C = pkgs.callPackage ./C/default.nix {};
                devShells.rust = pkgs.callPackage ./rust/default.nix {};
            }
        );
}
