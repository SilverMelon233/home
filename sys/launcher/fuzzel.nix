{ pkgs, ... }:
{
  home.packages = [ pkgs.fuzzel ];

  # fuzzel.ini main config — colors are loaded from the include file
  # matugen generates ~/.config/fuzzel/fuzzel-colors.ini
  home.file.".config/fuzzel/fuzzel.ini".text = ''
    [main]
    font=JetBrainsMono Nerd Font:size=13
    terminal=ghostty -e
    layer=overlay
    lines=10
    width=40
    horizontal-pad=16
    vertical-pad=12
    inner-pad=8
    image-size-ratio=0.4

    [border]
    width=2
    radius=8

    [dmenu]
    exit-immediately-if-empty=yes

    include=''${HOME}/.config/fuzzel/fuzzel-colors.ini
  '';
}
