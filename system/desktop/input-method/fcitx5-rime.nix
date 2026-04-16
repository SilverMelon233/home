{ pkgs, lib, ... }:
let
  fcitx5Pkg = pkgs.fcitx5;
in
{
  home.file.".local/share/fcitx5/rime/default.custom.yaml".text = ''
    patch:
      schema_list:
        - schema: rime_ice
  '';

  home.file.".config/fcitx5/conf/classicui.conf".text = ''
    [ClassicUI]
    Theme=matugen
    Font=Sans 12
  '';

  home.file.".local/share/fcitx5/skin/matugen/arrow.png".source = "${fcitx5Pkg}/share/fcitx5/themes/default/arrow.png";
  home.file.".local/share/fcitx5/skin/matugen/next.png".source = "${fcitx5Pkg}/share/fcitx5/themes/default/next.png";
  home.file.".local/share/fcitx5/skin/matugen/prev.png".source = "${fcitx5Pkg}/share/fcitx5/themes/default/prev.png";
  home.file.".local/share/fcitx5/skin/matugen/radio.png".source = "${fcitx5Pkg}/share/fcitx5/themes/default/radio.png";
}
