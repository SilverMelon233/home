{ ... }:
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "swaync"
    "ags"
    "hyprpaper"
    "fcitx5"
    "elephant"
    "walker --gapplication-service"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
  ];
}
