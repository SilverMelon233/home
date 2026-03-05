{ pkgs, ... }:
{
  home.packages = with pkgs; [
    papirus-icon-theme
    adwaita-icon-theme
    catppuccin-cursors.mochaMauve
    bibata-cursors
    librsvg
  ];
}
