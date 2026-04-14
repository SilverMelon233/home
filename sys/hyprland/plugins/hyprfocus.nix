{ pkgs, ... }:
{
  wayland.windowManager.hyprland.plugins = [ pkgs.hyprlandPlugins.hyprfocus ];

  wayland.windowManager.hyprland.extraConfig = ''
    plugin {
      hyprfocus {
        bezier=bezIn, 0.5, 0.0, 1.0, 0.5
        bezier=bezOut, 0.0, 0.5, 0.5, 1.0
        bezier=overshot, 0.05, 0.9, 0.1, 1.05
        bezier=smoothOut, 0.36, 0, 0.66, -0.56
        bezier=smoothIn, 0.25, 1, 0.5, 1
        bezier=realsmooth, 0.28, 0.29, 0.69, 1.08
        bezier=easeInOutBack, 0.68, -0.6, 0.32, 1.6
        flash {
          flash_opacity=0.300000
          in_bezier=bezIn
          in_speed=0.500000
          out_bezier=bezOut
          out_speed=3
        }
        shrink {
          in_bezier=easeInOutBack
          in_speed=1.000000
          out_bezier=easeInOutBack
          out_speed=3
          shrink_percentage=0.990000
        }
        animate_floating=yes
        animate_workspacechange=yes
        enabled=yes
        focus_animation=flash
      }
    }
  '';
}
