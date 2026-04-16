{ pkgs, ... }:
{
  home.packages = [ pkgs.btop ];

  # btop loads themes from ~/.config/btop/themes/
  # matugen generates matugen.theme there automatically
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "matugen";
      theme_background = false;
    };
  };
}