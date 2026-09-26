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

  programs.zsh.enable = true;

  # compat value; read `darwin-rebuild changelog` before changing
  system.stateVersion = 4;
}
