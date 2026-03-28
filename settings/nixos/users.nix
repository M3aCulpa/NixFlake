{
  config,
  lib,
  ...
}: let
  cfg = config.systemSettings;
in {
  options = {
    systemSettings.enable = lib.mkEnableOption "enable system settings";

    systemSettings.user = lib.mkOption {
      type = lib.types.attrs;
      description = ''
        the primary user of this system
        Ex:

        jbenge = {
          name = "jbenge";
          isNormalUser = true;
          description = "Johnathan";
          extraGroups = ["wheel"];
          shell = pkgs.zsh;
        }
      '';
    };
  };

  # Home-manager is excluded to make tracing down imports clearer.

  config = lib.mkIf cfg.enable {
    users.users.${cfg.user.name} = cfg.user;
  };
}
