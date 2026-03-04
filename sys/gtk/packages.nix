{ pkgs, ... }:
{
  home.packages = with pkgs; [
    papirus-icon-theme
    librsvg
  ];
}
