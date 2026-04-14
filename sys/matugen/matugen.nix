{
  pkgs,
  pkgs-unstable,
  userConfig,
  lib,
  config,
  ...
}:
let
  themesDir = toString ./templates;
  wallpaper = userConfig.matugen.wallpaperPath;

  # Helper to emit a TOML template block (with optional post_hook)
  tplBlock = name: attrs:
    let
      hook = if attrs ? post_hook
             then "\npost_hook   = \"${attrs.post_hook}\"\n"
             else "";
    in ''
      [templates.${name}]
      input_path  = "${attrs.input_path}"
      output_path = "${attrs.output_path}"${hook}
    '';
in
{
  home.packages = [ pkgs.matugen ];

  # ── matugen config.toml ──────────────────────────────────────────────────
  home.file.".config/matugen/config.toml".text = ''
    [config]
    reload_apps = true

    # ── Terminals ────────────────────────────────────────────────────────────
    ${tplBlock "ghostty" {
      input_path  = "${themesDir}/ghostty";
      output_path = "~/.config/ghostty/themes/Matugen";
      post_hook   = "pkill -SIGUSR2 ghostty || true";
    }}
    ${tplBlock "kitty" {
      input_path  = "${themesDir}/kitty-colors.conf";
      output_path = "~/.config/kitty/themes/Matugen.conf";
    }}
    ${tplBlock "zellij" {
      input_path  = "${themesDir}/zellij-theme.kdl.tera";
      output_path = "~/.config/zellij/themes/matugen.kdl";
    }}

    # ── Editors / IDEs ───────────────────────────────────────────────────────
    ${tplBlock "helix" {
      input_path  = "${themesDir}/helix.toml";
      output_path = "~/.config/helix/themes/matugen.toml";
    }}
    ${tplBlock "zed" {
      input_path  = "${themesDir}/zed-colors.json";
      output_path = "~/.config/zed/themes/matugen.json";
    }}
    ${tplBlock "neovim" {
      input_path  = "${themesDir}/neovim/template.lua";
      output_path = "~/.config/nvim/matugen.lua";
      post_hook   = "pkill -SIGUSR1 nvim || true";
    }}
    ${tplBlock "micro" {
      input_path  = "${themesDir}/micro.micro";
      output_path = "~/.config/micro/colorschemes/matugen.micro";
    }}

    # ── Shell prompt ─────────────────────────────────────────────────────────
    ${tplBlock "starship" {
      input_path  = "${themesDir}/starship-colors.toml";
      output_path = "~/.config/starship.toml";
    }}

    # ── Window managers ──────────────────────────────────────────────────────
    ${tplBlock "hyprland" {
      input_path  = "${themesDir}/hyprland-colors.conf";
      output_path = "~/.config/hypr/matugen-colors.conf";
      post_hook   = "hyprctl reload || true";
    }}
    ${tplBlock "niri" {
      input_path  = "${themesDir}/niri-colors.kdl";
      output_path = "~/.config/niri/matugen-colors.kdl";
    }}

    # ── File manager ─────────────────────────────────────────────────────────
    ${tplBlock "yazi" {
      input_path  = "${themesDir}/yazi-theme.toml";
      output_path = "~/.config/yazi/theme.toml";
    }}

    # ── Notification ─────────────────────────────────────────────────────────
    ${tplBlock "dunst" {
      input_path  = "${themesDir}/dunstrc-colors";
      output_path = "~/.config/dunst/dunstrc";
      post_hook   = "dunstctl reload || true";
    }}

    # ── GTK ──────────────────────────────────────────────────────────────────
    ${tplBlock "gtk3" {
      input_path  = "${themesDir}/gtk-colors.css";
      output_path = "~/.config/gtk-3.0/colors.css";
    }}
    ${tplBlock "gtk4" {
      input_path  = "${themesDir}/gtk-colors.css";
      output_path = "~/.config/gtk-4.0/colors.css";
    }}

    # ── Qt / Kvantum ─────────────────────────────────────────────────────────
    ${tplBlock "kvantum" {
      input_path  = "${themesDir}/kvantum-colors.kvconfig";
      output_path = "~/.config/Kvantum/matugen/matugen.kvconfig";
    }}
    ${tplBlock "kvantum-svg" {
      input_path  = "${themesDir}/kvantum-colors.svg";
      output_path = "~/.config/Kvantum/matugen/matugen.svg";
    }}
    ${tplBlock "qt5ct" {
      input_path  = "${themesDir}/qtct-colors.conf";
      output_path = "~/.config/qt5ct/colors/matugen.conf";
    }}
    ${tplBlock "qt6ct" {
      input_path  = "${themesDir}/qtct-colors.conf";
      output_path = "~/.config/qt6ct/colors/matugen.conf";
    }}

    # ── OpenCode ─────────────────────────────────────────────────────────────
    ${tplBlock "opencode" {
      input_path  = "${themesDir}/opencode-colors.json";
      output_path = "~/.config/opencode/themes/matugen.json";
    }}

    # ── Quickshell (dms) ─────────────────────────────────────────────────────
    ${tplBlock "quickshell" {
      input_path  = "${themesDir}/quickshell.json";
      output_path = "~/.local/state/quickshell/generated/colors.json";
    }}

    # ── Generic CSS variables ────────────────────────────────────────────────
    ${tplBlock "colors-css" {
      input_path  = "${themesDir}/colors.css";
      output_path = "~/.config/matugen/colors.css";
    }}
  '';

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
