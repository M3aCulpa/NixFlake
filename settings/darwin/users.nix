{
  config,
  lib,
  ...
}: let
  cfg = config.systemSettings;
in {
  config = lib.mkIf cfg.enable {
    # activation runs as root; homebrew and user-scoped options target this user
    system.primaryUser = cfg.user.name;

    nix-homebrew = {
      enable = true;
      user = cfg.user.name;
      autoMigrate = true;
    };
  };
}
