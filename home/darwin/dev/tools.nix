{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.pnpm
    pandoc
    nodejs_22
    cmake
    gnumake
    gcc
    sshuttle
    python3
    qemu
    sops
    yarn
    git
    gh
    go
  ];
}
