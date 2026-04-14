{ pkgs-unstable, ... }:
{
  home.packages = with pkgs-unstable; [
    opencode
    opencode-desktop
  ];
}
