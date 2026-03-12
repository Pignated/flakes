 { pkgs }: {
  # The raw list of packages (not a shell!)
  packages = ps: with ps; [
    numpy
    matplotlib
    pandas
    jupyterlab
    scipy
    scikit-learn
  ];

  # The shared environment variables
  shell = pkgs.mkShell {
    packages = [ (pkgs.python3.withPackages (ps: [ 
      numpy matplotlib pandas jupyterlab scipy scikit-learn
    ])) ];
    shellHook = "export USING_PYTHON=1";
  };
}  
