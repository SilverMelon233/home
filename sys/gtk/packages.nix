{ pkgs, pkgs-unstable, ... }:
{
  home.packages = [
    pkgs-unstable.papirus-icon-theme
    pkgs-unstable.adwaita-icon-theme
    pkgs-unstable.catppuccin-cursors.mochaMauve
    pkgs-unstable.bibata-cursors
    pkgs.librsvg
  ];
}
