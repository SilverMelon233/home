{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.packages = with pkgs-unstable; [
    quickshell
    dms-shell
    dgop
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "dms run"
  ];
  # programs.dms-shell = {
  #   enable = true;
  #   quickshell.package = pkgs.quickshell;
  # };
}
