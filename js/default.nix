


{ pkgs ? import <nixpkgs> {} }:
        
        pkgs.mkShell {
        name = "jsshell";
        buildInputs = with pkgs; [
            npm
        ];
        
        shellHook = ''       
            export USING_JS="1"
            '';
        }
    
