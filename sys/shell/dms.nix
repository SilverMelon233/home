{ pkgs, pkgs-unstable, ... }:
{
  # dms-shell with dynamic theming enabled.
  # enableDynamicTheming = true automatically includes pkgs.matugen as a
  # dependency and hooks into wallpaper changes to re-run matugen.
  # Reference: nixos/modules/programs/wayland/dms-shell.nix
  home.packages = with pkgs-unstable; [
    dms-shell
    quickshell
    dgop
    # matugen is also pulled in via dms enableDynamicTheming,
    # but we declare it explicitly via sys/matugen/matugen.nix
  ];

  wayland.windowManager.hyprland.extraConfig = ''
    exec-once=dms run
  '';
}
