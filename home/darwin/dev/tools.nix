{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.pnpm
    pandoc
    nodejs_22
    cmake
    gcc
    sshuttle
    python3
    sops
    yarn
    go
    uv
    ollama
    jdk
  ];
}
