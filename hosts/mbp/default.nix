let
  m3aculpa = {
    name = "m3aculpa";
    home = "/Users/m3aculpa";
  };
in {
  imports = [
    ./configuration.nix
    ../../settings/darwin
  ];

  systemSettings = {
    enable = true;
    user = m3aculpa;
  };

  home-manager.users = {
    "${m3aculpa.name}" = import ../../home/darwin;
  };
}