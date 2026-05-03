{pkgs, ...}: let
  jbenge = {
    name = "jbenge";
    isNormalUser = true;
    description = "Johnathan";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
in {
  imports = [
    ./configuration.nix
    ../../settings/nixos
  ];

  wsl.enable = true;

  systemSettings = {
    enable = true;
    user = jbenge;
  };

  home-manager.users.${jbenge.name} = import ../../home/nixos;
}
