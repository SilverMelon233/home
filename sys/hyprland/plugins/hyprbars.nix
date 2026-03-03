{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hyprbars ];
    settings.plugin.hyprbars = {
      bar_height = 28;
      bar_color = "rgba(282828ee)";
      bar_text_size = 11;
      bar_text_font = "Inter, Nerd Font";
      bar_part_of_window = true;
      bar_precedence_over_border = true;

      hyprbars-button = [
        "rgb(ff5f57), 15, , hyprctl dispatch hy3:killactive"
        "rgb(28c940), 15, , hyprctl dispatch fullscreen 1"
        "rgb(febc2e), 15, , hyprctl dispatch hy3:changegroup toggletab"
      ];
    };
  };
}