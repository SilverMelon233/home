{ pkgs, ... }:
{
  home.packages = with pkgs; [
    papirus-icon-them
    adwaita-icon-theme
    catppuccin-cursors
    librsvg
  ];
}
