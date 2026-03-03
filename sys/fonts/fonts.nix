{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.comic-shanns-mono
    noto-fonts-cjk-sans
    wqy_microhei
  ];
}
