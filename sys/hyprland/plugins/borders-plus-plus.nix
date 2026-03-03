{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.borders-plus-plus ];
    settings.plugin.borders-plus-plus = {
      add_borders = 2;
      "col.border_1" = "rgb(ffffff)";
      "col.border_2" = "rgb(cba6f7)";
      border_size_1 = 1;
      natural_rounding = "yes";
    };
  };
}