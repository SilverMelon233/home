{ pkgs-unstable, ... }:
{
  home.packages = [
    pkgs-unstable.opencode
    pkgs-unstable.opencode-desktop
  ];
}
