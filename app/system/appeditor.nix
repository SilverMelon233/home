{ pkgs, ... }:
{
  home.packages = with pkgs; [
    appeditor
  ];
}