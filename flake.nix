{
    description = "Monorepo with multiple dev shells";
    inputs = {
        nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };
    outputs = { self, nixpkgs, flake-utils, ...}:
        let 
        autogen_template_langs = [ "rust" "C" "java" "js" ];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        mkTemplate = lang : {
            name = lang;
            value = {
                path = ./${lang}/template;
                description = "x86_64-linux ${lang} template";
            };

        };
        allTemplates = {
            python = {
                    path = ./python/template;
                    description = "Python dev template";
            };
        } // builtins.listToAttrs (map mkTemplate autogen_template_langs);
        in 
            {
                templates = allTemplates;
                devShells.x86_64-linux = {
                java = pkgs.callPackage ./java/default.nix {};
                C = pkgs.callPackage ./C/default.nix {};
                rust = pkgs.callPackage ./rust/default.nix {};
                js = pkgs.callPackage ./js/default.nix {};
            };
    
    apps.x86_64-linux.generate = {
        type = "app";
        program = toString (pkgs.writeShellScript "gen-templates" ''
          for lang in ${builtins.concatStringsSep " " autogen_template_langs}; do
            echo "Syncing $lang/template..."
            mkdir -p $lang/template
            echo "use flake" > $lang/template/.envrc
            
            cat <<EOF > $lang/template/flake.nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    my-repo.url = "github:pignated/flakes";
  };

  outputs = { self, nixpkgs, my-repo }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      myPackage = pkgs.callPackage (my-repo + "/$lang/default.nix") { };
    in
    {
      packages.x86_64-linux.default = myPackage;
      devShells.x86_64-linux.default = pkgs.mkShell {
        inputsFrom = [ myPackage ];
        shellHook = myPackage.shellHook or "";
      };
    };
}
EOF
          done
          echo "Generation complete. Python template was left untouched."
        '');
      };
    };
}
