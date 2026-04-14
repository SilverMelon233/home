{
  pkgs,
  pkgs-unstable,
  userConfig,
  lib,
  config,
  ...
}:
let
  themesDir = toString ../../matugen-themes/templates;
  wallpaper = userConfig.matugen.wallpaperPath;
in
{
  home.packages = [ pkgs.matugen ];

  # ── matugen config.toml ──────────────────────────────────────────────────
  home.file.".config/matugen/config.toml" = {
    text = lib.generators.toTOML { } {
      config.reload_apps = true;
      templates = {
        # Terminals
        ghostty = {
          input_path = "${themesDir}/ghostty";
          output_path = "~/.config/ghostty/themes/Matugen";
          post_hook = "pkill -SIGUSR2 ghostty || true";
        };
        kitty = {
          input_path = "${themesDir}/kitty-colors.conf";
          output_path = "~/.config/kitty/themes/Matugen.conf";
        };
        zellij = {
          input_path = "${themesDir}/zellij-theme.kdl.tera";
          output_path = "~/.config/zellij/themes/matugen.kdl";
        };
        # Editors
        helix = {
          input_path = "${themesDir}/helix.toml";
          output_path = "~/.config/helix/themes/matugen.toml";
        };
        zed = {
          input_path = "${themesDir}/zed-colors.json";
          output_path = "~/.config/zed/themes/matugen.json";
        };
        # Shell prompt
        starship = {
          input_path = "${themesDir}/starship-colors.toml";
          output_path = "~/.config/starship.toml";
        };
        # Window managers
        hyprland = {
          input_path = "${themesDir}/hyprland-colors.conf";
          output_path = "~/.config/hypr/matugen-colors.conf";
          post_hook = "hyprctl reload || true";
        };
        niri = {
          input_path = "${themesDir}/niri-colors.kdl";
          output_path = "~/.config/niri/matugen-colors.kdl";
        };
        # File manager
        yazi = {
          input_path = "${themesDir}/yazi-theme.toml";
          output_path = "~/.config/yazi/theme.toml";
        };
        # Notification
        dunst = {
          input_path = "${themesDir}/dunstrc-colors";
          output_path = "~/.config/dunst/dunstrc";
          post_hook = "dunstctl reload || true";
        };
        # GTK
        gtk3 = {
          input_path = "${themesDir}/gtk-colors.css";
          output_path = "~/.config/gtk-3.0/colors.css";
        };
        gtk4 = {
          input_path = "${themesDir}/gtk-colors.css";
          output_path = "~/.config/gtk-4.0/colors.css";
        };
        # Kvantum / Qt
        kvantum = {
          input_path = "${themesDir}/kvantum-colors.kvconfig";
          output_path = "~/.config/Kvantum/matugen/matugen.kvconfig";
        };
        kvantum-svg = {
          input_path = "${themesDir}/kvantum-colors.svg";
          output_path = "~/.config/Kvantum/matugen/matugen.svg";
        };
        qt5ct = {
          input_path = "${themesDir}/qtct-colors.conf";
          output_path = "~/.config/qt5ct/colors/matugen.conf";
        };
        qt6ct = {
          input_path = "${themesDir}/qtct-colors.conf";
          output_path = "~/.config/qt6ct/colors/matugen.conf";
        };
        # OpenCode
        opencode = {
          input_path = "${themesDir}/opencode-colors.json";
          output_path = "~/.config/opencode/themes/matugen.json";
        };
        # Quickshell (dms)
        quickshell = {
          input_path = "${themesDir}/quickshell.json";
          output_path = "~/.local/state/quickshell/generated/colors.json";
        };
        # Neovim (base16-nvim lua theme)
        neovim = {
          input_path = "${themesDir}/neovim/template.lua";
          output_path = "~/.config/nvim/matugen.lua";
          post_hook = "pkill -SIGUSR1 nvim || true";
        };
        # Micro editor
        micro = {
          input_path = "${themesDir}/micro.micro";
          output_path = "~/.config/micro/colorschemes/matugen.micro";
        };
        # Generic CSS variables
        colors-css = {
          input_path = "${themesDir}/colors.css";
          output_path = "~/.config/matugen/colors.css";
        };
      };
    };
  };

  # ── Ensure gtk css import files exist ────────────────────────────────────
  home.file.".config/gtk-3.0/gtk.css".text = ''
    @import 'colors.css';
  '';
  home.file.".config/gtk-4.0/gtk.css".text = ''
    @import 'colors.css';
  '';

  # ── Kvantum: set active theme to matugen ─────────────────────────────────
  home.file.".config/Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=matugen
  '';

  # ── Activation: run matugen once on first switch ─────────────────────────
  home.activation.matugen = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    WALLPAPER="${wallpaper}"
    if [ -f "$WALLPAPER" ]; then
      echo "matugen: generating theme from $WALLPAPER"
      ${pkgs.matugen}/bin/matugen image "$WALLPAPER" || true
    else
      $DRY_RUN_CMD echo "matugen: wallpaper not found at $WALLPAPER, skipping"
      $DRY_RUN_CMD echo "         Run: matugen image <wallpaper-path>"
    fi
  '';
}
