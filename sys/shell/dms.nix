{
  pkgs-unstable,
  ...
}:
{
  home.packages = [
    pkgs-unstable.dms-shell
    pkgs-unstable.quickshell
    pkgs-unstable.dgop
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "dms run"
  ];
}
