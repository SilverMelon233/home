{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  i18n = {
    language = "zh-cn";
  };

  zed-extensions = [
    "nix"
    "toml"
    "html"
    "opencode"
  ];

  matugen = {
    # Path to wallpaper used by dms for dynamic theming.
    # dms stores the current wallpaper here after the user selects one.
    wallpaperPath = "$HOME/.local/share/dms/wallpaper";
  };
}
