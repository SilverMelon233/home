{ pkgs, ... }:
{
  home.packages = [ pkgs.hyprpanel ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "hyprpanel"
  ];
}
