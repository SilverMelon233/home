{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hypr-dynamic-cursors ];
    settings.plugin.hypr-dynamic-cursors = {
      enabled = true;
      mode = "stretch";
      threshold = 2;
    };
  };
}