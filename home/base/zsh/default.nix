{
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;

    history = {
      size = 50000;
      save = 50000;
      ignoreAllDups = true;
      share = true;
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    oh-my-zsh = {
      enable = true;
      theme = "";
      plugins = [
        "git"
        "brew"
        "fzf"
        "docker"
        "kubectl"
        "history-substring-search"
      ];
    };

    initContent = lib.mkMerge [
      # p10k instant prompt has to run before anything else prints
      (lib.mkOrder 500 ''
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
      '')
      ''
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      ''
    ];
  };
}
