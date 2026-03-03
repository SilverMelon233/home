{ pkgs, ... }:
{
  wayland.windowManager.hyprland.plugins = [ pkgs.hyprlandPlugins.xtra-dispatchers ];
}