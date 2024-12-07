{pkgs, ...}: {

  # System packages
  environment.systemPackages = with pkgs; [
    git
    jq
    docker
    buildkit
    rootlesskit
    containerd
    docker-compose
    gnupg
    neofetch
    openssl
    parallel
    pcsctools
    qemu
    sshpass
    virtio-win
    xsel
  ];

  # Add zsh to /etc/shells.
  environment.shells = with pkgs; [zsh];

  # Programs
  programs = {
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # Time zone
  time = {
    hardwareClockInLocalTime = true;
    timeZone = "America/New_York";
  };

  # Select internationalisation properties.
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

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}