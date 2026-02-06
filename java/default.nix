


{ pkgs ? import <nixpkgs> {} }:
    let
        jdtls-plugin = pkgs.vimPlugins.nvim-jdtls;
    in
        
        pkgs.mkShell {
        name = "javaShell";
        buildInputs = with pkgs; [
            jdk8
            jdk21
            jdt-language-server
            maven
            google-java-format
        ];
        
        shellHook = ''       
            export USING_JAVA="1"
            export JDTLS_PATH="${pkgs.jdt-language-server}/bin/jdtls"
            export XDG_DATA_DIRS="${jdtls-plugin}:$XDG_DATA_DIRS"
            export NVIM_JDTLS_HOME="${jdtls-plugin}"
            '';
        }
    
