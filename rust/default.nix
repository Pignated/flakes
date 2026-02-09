


{ pkgs ? import <nixpkgs> {} }:
    let
        jdtls-plugin = pkgs.vimPlugins.nvim-jdtls;
    in
        
        pkgs.mkShell {
        name = "javaShell";
        buildInputs = with pkgs; [
            rustc
            cargo
            rustfmt
            rust-analyzer
        ];
        
        shellHook = ''       
            export USING_RUST="1"
            '';
        }
    
