{
  
  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system:
        let
            pkgs = import nixpkgs { inherit system; };
            jdtls-plugin = pkgs.vimPlugins.nvim-jdtls;
        in
        {
            devShells.default = pkgs.mkShell {
                packages = with pkgs; [
                    jdk8 #Actual java version for project
                    jdk21 #Needed for language server
                    jdt-language-server
                    maven
                    google-java-format
                ];
            };
        });

}



{ pkgs ? import <nixpkgs> {} }:
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
