  # github:pignated/flakes/python/default.nix
{ pkgs }: {
  # The list of packages as a function of 'ps'
  packages = ps: with ps; [
    numpy
    matplotlib
    pandas
    jupyterlab
    scipy
    scikit-learn
  ];

  # The environment variables (THIS WAS LIKELY MISSING)
  shell = pkgs.mkShell {
    packages = [ 
      (pkgs.python3.withPackages (ps: with ps; [ # Added 'with ps;' here
        numpy 
        matplotlib 
        pandas 
        jupyterlab 
        scipy 
        scikit-learn
      ])) 
    ];
    shellHook = "export USING_PYTHON=1";
  };

  env = { USING_PYTHON = "1"; };
  shellHook = "echo 'Python base environment loaded!'";
}

