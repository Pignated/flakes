  # github:pignated/flakes/python/default.nix
{ pkgs }: {
  packages =[
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

