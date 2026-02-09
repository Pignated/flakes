


{ pkgs ? import <nixpkgs> {} }:
        
        pkgs.mkShell {
        name = "CShell";
        buildInputs = with pkgs; [
            gcc
            gnumake
            clang-tools
            valgrind
            gdb
        ];
        
        shellHook = ''       
            export USING_C="1"
            '';
        }
    
