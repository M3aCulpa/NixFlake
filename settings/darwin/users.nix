{
  config,
  lib,
  ...
}: let
  cfg = config.systemSettings;
in {
  config = lib.mkIf cfg.enable {
    # nix-darwin runs activation as root; homebrew and user-scoped options apply to this user
    system.primaryUser = cfg.user.name;

    nix-homebrew = {
      enable = true;
      user = cfg.user.name;
      autoMigrate = true;
    };
  };
}
