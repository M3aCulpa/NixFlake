{pkgs, ...}: {
  imports = [./services.nix];

  environment = {
    systemPackages = with pkgs; [
      git
      docker
      buildkit
      rootlesskit
      containerd
      docker-compose
      gnupg
      neofetch
      openssl
      parallel
      azure-cli
      kubectl
      kind
      kubernetes-helm
      pcsctools
      qemu
      sshpass
      virtio-win
      xsel
    ];
    shells = with pkgs; [zsh];
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;
  };

  programs = {
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "America/New_York";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [
      22
      3306
      6443 # k3s API server
      8080
    ];
  };

  virtualisation = {
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
    containerd.enable = true;
    libvirtd.enable = true;
  };

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05";
}
