


{ pkgs ? import <nixpkgs> {} }:
        
        pkgs.mkShell {
        name = "jsshell";
        buildInputs = with pkgs; [
            nodejs
            typescript-language-server
            typescript
            vscode-langservers-extracted
            
        ];
        
        shellHook = ''       
            export USING_JS="1"
            '';
        }
    
