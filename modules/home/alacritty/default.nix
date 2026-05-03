{
  lib,
  config,
  ...
}: {
  options.myAlacritty = {
    fontFamily = lib.mkOption {
      type = lib.types.str;
      default = "MesloLGS Nerd Font Mono";
      description = "the font family to render";
    };

    fontSize = lib.mkOption {
      type = lib.types.number;
      default = 13;
      description = "the font size to render";
    };

    opacity = lib.mkOption {
      type = lib.types.number;
      default = 0.60;
      description = "background window opacity";
    };
  };

  config.home.file."./.config/alacritty/alacritty.toml".text = let
    cfg = config.myAlacritty;
  in ''
    # Alacritty: Catppuccin Mocha + transparency

    [window]
    opacity = ${builtins.toString cfg.opacity}
    blur = true
    padding = { x = 16, y = 16 }
    decorations = "buttonless"
    startup_mode = "Windowed"
    dimensions = { columns = 220, lines = 50 }
    title = "alacritty"
    dynamic_title = true

    [[keyboard.bindings]]
    key = "Return"
    mods = "Command"
    action = "ToggleFullscreen"

    [font]
    size = ${builtins.toString cfg.fontSize}

    [font.normal]
    family = "${cfg.fontFamily}"
    style = "Regular"

    [font.bold]
    family = "${cfg.fontFamily}"
    style = "Bold"

    [font.italic]
    family = "${cfg.fontFamily}"
    style = "Italic"

    [cursor]
    style = { shape = "Block", blinking = "On" }
    blink_interval = 600
    unfocused_hollow = true

    [scrolling]
    history = 10000

    # Catppuccin Mocha palette
    [colors.primary]
    background = "#1e1e2e"
    foreground = "#cdd6f4"
    dim_foreground = "#7f849c"
    bright_foreground = "#cdd6f4"

    [colors.cursor]
    text = "#1e1e2e"
    cursor = "#f5e0dc"

    [colors.vi_mode_cursor]
    text = "#1e1e2e"
    cursor = "#b4befe"

    [colors.search.matches]
    foreground = "#1e1e2e"
    background = "#a6adc8"

    [colors.search.focused_match]
    foreground = "#1e1e2e"
    background = "#a6e3a1"

    [colors.footer_bar]
    foreground = "#1e1e2e"
    background = "#a6adc8"

    [colors.hints.start]
    foreground = "#1e1e2e"
    background = "#f9e2af"

    [colors.hints.end]
    foreground = "#1e1e2e"
    background = "#a6adc8"

    [colors.selection]
    text = "#1e1e2e"
    background = "#f2cdcd"

    [colors.normal]
    black   = "#45475a"
    red     = "#f38ba8"
    green   = "#a6e3a1"
    yellow  = "#f9e2af"
    blue    = "#89b4fa"
    magenta = "#f5c2e7"
    cyan    = "#94e2d5"
    white   = "#bac2de"

    [colors.bright]
    black   = "#585b70"
    red     = "#f38ba8"
    green   = "#a6e3a1"
    yellow  = "#f9e2af"
    blue    = "#89b4fa"
    magenta = "#f5c2e7"
    cyan    = "#94e2d5"
    white   = "#a6adc8"

    [colors.dim]
    black   = "#45475a"
    red     = "#f38ba8"
    green   = "#a6e3a1"
    yellow  = "#f9e2af"
    blue    = "#89b4fa"
    magenta = "#f5c2e7"
    cyan    = "#94e2d5"
    white   = "#bac2de"
  '';
}
