{ pkgs, ... }:
{
  home.packages = [ pkgs.hyprlock ];

  programs.hyprlock = {
    enable = true;
  };
}