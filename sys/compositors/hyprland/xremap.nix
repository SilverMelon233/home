{ pkgs, ... }:
{
  # xremap service config is disabled for now
  # Packages kept for potential future use
  home.packages = with pkgs; [
    xremap
    kitty
  ];
}
