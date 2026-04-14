{ pkgs, ... }:
{
  wayland.windowManager.hyprland.plugins = [ pkgs.hyprlandPlugins.hypr-dynamic-cursors ];

  wayland.windowManager.hyprland.extraConfig = ''
    plugin {
      hypr-dynamic-cursors {
        enabled=true
        mode=stretch
        threshold=2
      }
    }
  '';
}
