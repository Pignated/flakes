{ pkgs }: 
let
  # This must be defined as a function taking 'ps'
  pythonLibraries = ps: with ps; [
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
  ];
in
{
  # THIS LINE IS REQUIRED
  inherit pythonLibraries;

  env = { USING_PYTHON = "1"; };

  shellHook = ''
    export USING_PYTHON=1
    if command -v nbdime >/dev/null; then
      nbdime config-git --enable --global
    fi
  '';
}

