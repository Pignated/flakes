


{ pkgs ? import <nixpkgs> {} }:
let
    pythonEnv = pkgs.python3.withPackages(ps: with ps;  [ 
                numpy
                matplotlib
                pandas
                jupyterlab
                scipy
                scikit-learn
            ]);
    in
        pkgs.mkShell {
        name = "pythonShell";
        buildInputs = with pkgs; [
            pythonEnv
        ];
        
        shellHook = ''       
            export USING_PYTHON="1"
            '';
        }
    
