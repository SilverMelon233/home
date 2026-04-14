{ pkgs, ... }:
{
  wayland.windowManager.hyprland.plugins = [ pkgs.hyprlandPlugins.hyprbars ];

  wayland.windowManager.hyprland.extraConfig = ''
    plugin {
      hyprbars {
        # Colors from matugen-generated ~/.config/hypr/matugen-colors.conf
        bar_color=$surface_container
        bar_height=28
        bar_part_of_window=true
        bar_precedence_over_border=true
        bar_text_font=Inter, Nerd Font
        bar_text_size=11
        # Buttons use Material You semantic colors:
        #   error    → close (red equivalent)
        #   tertiary → fullscreen (green equivalent)
        #   secondary → tab toggle (yellow equivalent)
        hyprbars-button=$error, 15, , hyprctl dispatch hy3:killactive
        hyprbars-button=$tertiary, 15, , hyprctl dispatch fullscreen 1
        hyprbars-button=$secondary, 15, , hyprctl dispatch hy3:changegroup toggletab
      }
    }
  '';
}
