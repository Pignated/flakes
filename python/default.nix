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
  env = {
    USING_PYTHON = "1";
  };

}  
