{ pkgs, lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  home.packages = with pkgs; [
    hyprshutdown
    zenity
  ];

  wayland.windowManager.hyprland.extraConfig = lib.mkBefore ''
    # ── Matugen color variables (MUST BE FIRST) ──────────────────────────────────
    source=~/.config/hypr/matugen-colors.conf
  '';
}