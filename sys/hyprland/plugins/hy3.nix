{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hy3 ];
    settings.plugin.hy3 = {
      node_collapse_policy = 2;
      group_inset = 4;
      autotile = {
        enable = true;
      };
    };
  };
}
