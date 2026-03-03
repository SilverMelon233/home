{ pkgs, ... }:
{
  home.packages = with pkgs; [
    papirus-icon-theme
    librsvg
    nwg-look
    nwg-displays
  ];
}
