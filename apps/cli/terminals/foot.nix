{ pkgs, ... }:
{
  home.packages = [ pkgs.foot ];

  home.file.".config/foot/foot.ini".text = ''
    font=JetBrainsMono Nerd Font:size=13
    pad=8x8
    term=xterm-256color

    [mouse]
    hide-when-typing=yes

    include=~/.config/foot/theme.ini
  '';
}