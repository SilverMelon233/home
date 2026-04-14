{ pkgs, ... }:
{
  wayland.windowManager.hyprland.plugins = [ pkgs.hyprlandPlugins.borders-plus-plus ];

  wayland.windowManager.hyprland.extraConfig = ''
    plugin {
      borders-plus-plus {
        add_borders=2
        border_size_1=1
        # Colors from matugen-generated ~/.config/hypr/matugen-colors.conf
        col.border_1=$on_surface_variant
        col.border_2=$primary
        natural_rounding=yes
      }
    }
  '';
}
