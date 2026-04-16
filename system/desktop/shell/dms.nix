{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dms-shell
    quickshell
    dgop
  ];
}
