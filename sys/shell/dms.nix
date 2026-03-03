{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.quickshell
    pkgs.dms-shell
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "fcitx5"
    "dms run"
  ];
  # programs.dms-shell = {
  #   enable = true;
  #   quickshell.package = pkgs.quickshell;
  # };
}
