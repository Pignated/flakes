{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  name = "racketShell";
  buildInputs = with pkgs; [
    racket
  ];

  shellHook = "";
}
