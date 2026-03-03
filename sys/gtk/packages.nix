{ pkgs, ... }:
{
  home.packages = with pkgs; [
    papirus-icon-theme
    candy-icons
    sweet-folders
    librsvg
    nwg-look
    nwg-displays
  ];
}
