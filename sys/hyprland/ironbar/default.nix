{ pkgs, config, ... }:
{
  home.packages = [ pkgs.ironbar ];

  xdg.configFile."ironbar/config.json" = {
    source = ./config.json;
  };

  xdg.configFile."ironbar/style.css" = {
    source = ./style.css;
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    # "ironbar"
  ];
}
