{ pkgs,
  lib,
  config,
  ...
}:
let
  themesDir = toString ./templates;
  wallpaper = "$HOME/.local/share/dms/wallpaper";

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

    # ── Browsers ─────────────────────────────────────────────────────────────
    ${tplBlock "vivaldi" {
      input_path  = "${themesDir}/vivaldi.css";
      output_path = "~/.config/vivaldi/custom.css";
    }}

    # ── Recording ────────────────────────────────────────────────────────────
    ${tplBlock "obs" {
      input_path  = "${themesDir}/obs-theme.obt";
      output_path = "~/.config/obs-studio/themes/Matugen.obt";
    }}

    # ── Editors / IDEs ───────────────────────────────────────────────────────
    ${tplBlock "vscode-pkg" {
      input_path  = "${themesDir}/vscode-package.json";
      output_path = "~/.vscode-oss/extensions/dms.matugen-theme-1.0.0/package.json";
    }}
    ${tplBlock "vscode-theme" {
      input_path  = "${themesDir}/vscode-color-theme.json";
      output_path = "~/.vscode-oss/extensions/dms.matugen-theme-1.0.0/themes/matugen-color-theme.json";
    }}
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

    # ── Window manager ───────────────────────────────────────────────────────
    ${tplBlock "niri" {
      input_path  = "${themesDir}/niri-colors.kdl";
      output_path = "~/.config/niri/matugen-colors.kdl";
    }}

    # ── Input method ──────────────────────────────────────────────────────────
    ${tplBlock "fcitx5" {
      input_path  = "${themesDir}/fcitx5-theme.conf";
      output_path = "~/.local/share/fcitx5/skin/matugen/theme.conf";
    }}

    # ── File manager ─────────────────────────────────────────────────────────
    ${tplBlock "yazi" {
      input_path  = "${themesDir}/yazi-theme.toml";
      output_path = "~/.config/yazi/theme.toml";
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

    # ── System monitor ───────────────────────────────────────────────────────
    ${tplBlock "btop" {
      input_path  = "${themesDir}/btop.theme";
      output_path = "~/.config/btop/themes/matugen.theme";
    }}

    # ── Fuzzy finder ─────────────────────────────────────────────────────────
    ${tplBlock "television" {
      input_path  = "${themesDir}/television.toml";
      output_path = "~/.config/television/themes/matugen.toml";
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

  # ── Activation: DMS manages theme generation, no matugen on switch ──────
}
