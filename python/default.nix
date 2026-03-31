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
    nbdime
    python-lsp-server
    pylsp-pylint
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
        nbdime
        python-lsp-server
        pylsp-pylint
      ])) 
    ];
    shellHook = "export USING_PYTHON=1;nbdime config-git --enable --global";
  };

  env = { USING_PYTHON = "1"; };
  shellHook = "nbdime config-git --enable --global";
}

