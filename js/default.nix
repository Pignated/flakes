


{ pkgs ? import <nixpkgs> {} }:
        
        pkgs.mkShell {
        name = "jsshell";
        buildInputs = with pkgs; [
            nodejs
        ];
        
        shellHook = ''       
            export USING_JS="1"
            '';
        }
    
