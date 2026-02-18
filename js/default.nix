


{ pkgs ? import <nixpkgs> {} }:
        
        pkgs.mkShell {
        name = "JSShell";
        buildInputs = with pkgs; [
            npm
        ];
        
        shellHook = ''       
            export USING_JS="1"
            '';
        }
    
