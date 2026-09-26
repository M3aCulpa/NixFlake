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
    eza
    fzf
    git-filter-repo
  ];

  programs = {
    # zoxide: smarter cd
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    # atuin: sqlite shell history synced across shells
    atuin = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    # bat: cat with syntax highlighting and git integration
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
