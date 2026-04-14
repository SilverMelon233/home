{ pkgs, ... }:
{
  wayland.windowManager.hyprland.plugins = [ pkgs.hyprlandPlugins.hy3 ];

  wayland.windowManager.hyprland.extraConfig = ''
    plugin {
      hy3 {
        autotile {
          enable=true
        }
        group_inset=4
        node_collapse_policy=2
      }
    }
  '';
}
