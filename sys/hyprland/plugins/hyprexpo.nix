{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hyprexpo ];
    settings.plugin.hyprexpo = {
      columns = 3;
      gap_size = 5;
      bg_col = "rgb(111111)";
      workspace_method = "center current";
      skip_empty = true;
    };
  };
}