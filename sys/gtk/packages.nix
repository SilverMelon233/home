{ pkgs, ... }:
{
  home.packages = with pkgs; [
    papirus-icon-theme
    adwaita-icon-theme
    # Catppuccin cursor retained as requested
    catppuccin-cursors.mochaMauve
    bibata-cursors
  ] ++ [ pkgs.librsvg ];
}
