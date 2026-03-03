{ pkgs, ... }:
{
  home.packages = with pkgs; [
    candy-icons
    sweet-folders
    librsvg
    nwg-look
    nwg-displays
    grimblast
    waypaper
  ];
}