


{ pkgs ? import <nixpkgs> {} }:
        
        pkgs.mkShell {
        name = "javaShell";
        buildInputs = with pkgs; [
            gcc
            gnumake
        ];
        
        shellHook = ''       
            export USING_C="1"
            '';
        }
    
