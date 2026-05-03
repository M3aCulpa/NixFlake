{pkgs, ...}: {
  home.packages = with pkgs; [
    cmake
    gcc
    go
    texliveBasic
    pgcli
  ];
}