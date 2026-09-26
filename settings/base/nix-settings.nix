{pkgs, ...}: {
  nix = {
    package = pkgs.nix;
    settings.experimental-features = ["nix-command" "flakes"];

    # auto-optimise-store corrupts the store on macos; nix-darwin refuses it
    optimise.automatic = true;

    gc =
      {
        automatic = true;
        options = "--delete-older-than 7d";
      }
      // (
        if pkgs.stdenv.isDarwin
        then {
          interval = {
            Weekday = 0;
            Hour = 0;
            Minute = 0;
          };
        }
        else {dates = "weekly";}
      );
  };

  nixpkgs.config.allowUnfree = true;
}
