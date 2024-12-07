{pkgs, ...}: {
  home.packages = with pkgs; [
    ripgrep
    gnumake
    gnutar
    gnupg
    tmux
    wget
    tree
    gh
    jq
    yq
  ];

  programs = {
    # zoxide is a smarter cd command, inspired by z and autojump.
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    # atuin replaces existing shell history with a SQLite database and syncs it across all your shells.
    atuin = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    # a cat clone with syntax highlighting and Git integration.
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "catppuccin-mocha";
      };
    };

    tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      shortcut = "a";
      baseIndex = 1;
      escapeTime = 1;

      plugins = with pkgs; [
        tmuxPlugins.yank
      ];

      extraConfig = builtins.readFile ./tmux.conf;
    };
  };
}
