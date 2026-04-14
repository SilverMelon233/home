{ pkgs, lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  # Matugen colors must be sourced BEFORE any plugin config
  # Use mkBefore to ensure this appears first in the merged config
  wayland.windowManager.hyprland.extraConfig = lib.mkBefore ''
    # ── Matugen color variables (MUST BE FIRST) ──────────────────────────────────
    source=~/.config/hypr/matugen-colors.conf
  '';
}