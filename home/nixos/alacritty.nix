{...}: {
  imports = [
    ../../modules/home/alacritty
  ];

  programs.alacritty = {
    enable = true;
    fontSize = 10.25;
  };
}