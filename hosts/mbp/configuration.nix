{pkgs, ...}: {
  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.systemPackages = with pkgs; [
    qemu
  ];

  homebrew.casks = [
    "alacritty"
    "amazon-kindle"
    "bitwarden"
    "blender"
    "discord"
    "docker"
    "firefox"
    "google-chrome"
    "microsoft-office"
    "notion"
    "slack"
    "sparrow"
    "spotify"
    "steam"
    "surfshark"
    "unity-hub"
    "vmware-fusion"
    "wasabi-wallet"
    "windows-app"
    "wondershare-dr.fone"
    "xquartz"
    "yubico-authenticator"
    "zoom"
  ];

  services.nix-daemon.enable = true;
  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
