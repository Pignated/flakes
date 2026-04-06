  # github:pignated/flakes/python/default.nix
{ pkgs }: {
  # The list of packages as a function of 'ps'
  packages =[
          pkgs.basedpyright
          (pkgs.python3.withPackages ( ps: with ps; [
    numpy
    matplotlib
    pandas
    jupyterlab
    scipy
    scikit-learn
    nbdime
    python-lsp-server
    pyls-flake8
    flake8
    black
    python-lsp-black
      ]))
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
        pyls-flake8
        flake8
                  black
                  py-lsp-black
                  
      ])) 
    ];
    shellHook = "export USING_PYTHON=1;nbdime config-git --enable --global";
  };

  env = { USING_PYTHON = "1"; };
  shellHook = "nbdime config-git --enable --global";
}

