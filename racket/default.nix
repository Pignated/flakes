


{ pkgs ? import <nixpkgs> {} }:
    let
        jdtls-plugin = pkgs.vimPlugins.nvim-jdtls;
    in
        
        pkgs.mkShell {
        name = "javaShell";
        buildInputs = with pkgs; [
        racket
        ];
        
        shellHook = ''       
            '';
        }
    
