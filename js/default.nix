{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  name = "jsshell";
  buildInputs = with pkgs; [
    nodejs
    typescript-language-server
    typescript
    vscode-langservers-extracted
    emmet-language-server
  ];

  shellHook = ''
    export USING_JS="1"
  '';
}
