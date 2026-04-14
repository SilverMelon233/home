{ pkgs, ... }:
{
  wayland.windowManager.hyprland.plugins = [ pkgs.hyprlandPlugins.hyprexpo ];

  wayland.windowManager.hyprland.extraConfig = ''
    plugin {
      hyprexpo {
        bg_col=$surface
        columns=3
        gap_size=5
        skip_empty=true
        workspace_method=center current
      }
    }
  '';
}
