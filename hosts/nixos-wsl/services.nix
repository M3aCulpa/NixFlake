{pkgs, ...}: {
  services = {
    # Enable the OpenSSH daemon.
    openssh = {
      enable = true;
      settings = {
        X11Forwarding = true;
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };

    # Enable smartcards
    pcscd = {
      enable = true;
    };
    
    # Enable the Pantheon Desktop Environment.
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      displayManager = {
        lightdm.enable = true;
      };
      desktopManager = {
        pantheon = {
          enable = true;
          extraGSettingsOverrides = ''
            [io.elementary.terminal.settings]
            font='Mononoki Nerd Font 10'
            follow-last-tab=true
          '';
          extraGSettingsOverridePackages = [
            pkgs.pantheon.elementary-terminal
          ];
        };
      };
    };
  };
}