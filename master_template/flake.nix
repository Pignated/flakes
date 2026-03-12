{
  description = "Project template for __LANG__ on x86_64-linux";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    my-repo.url = "github:youruser/yourrepo";
  };

  outputs = { self, nixpkgs, my-repo }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.\${system};
      # Pulls the default.nix for this specific language from the remote repo
      myPackage = pkgs.callPackage "\${my-repo}/__LANG__/default.nix" { };
    in
    {
      packages.\${system}.default = myPackage;

      devShells.\${system}.default = pkgs.mkShell {
        inputsFrom = [ myPackage ];
        shellHook = myPackage.shellHook or "";
      };
    };
}

