{
  config,
  lib,
  ...
}: let
  cfg = config.systemSettings;
in {
  options.systemSettings = {
    enable = lib.mkEnableOption "system settings";

    user = lib.mkOption {
      type = lib.types.attrs;
      description = "the primary user of this system; passed straight to users.users.<name>";
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.user.name} = cfg.user;
  };
}
