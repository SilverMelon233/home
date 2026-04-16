{ pkgs, lib, ... }:
let
  fcitx5Pkg = pkgs.fcitx5;
in
{
  # Rime input method with rime_ice schema for Chinese input
  home.file.".local/share/fcitx5/rime/default.custom.yaml".text = ''
    patch:
      schema_list:
        - schema: rime_ice
  '';

  wayland.windowManager.hyprland.extraConfig = ''
    exec-once=fcitx5
  '';

  # Set fcitx5 to use matugen theme
  home.file.".config/fcitx5/conf/classicui.conf".text = ''
    [ClassicUI]
    Theme=matugen
    Font=Sans 12
  '';

  # Copy fcitx5 theme images (required for theme to work)
  home.file.".local/share/fcitx5/skin/matugen/arrow.png".source = "${fcitx5Pkg}/share/fcitx5/themes/default/arrow.png";
  home.file.".local/share/fcitx5/skin/matugen/next.png".source = "${fcitx5Pkg}/share/fcitx5/themes/default/next.png";
  home.file.".local/share/fcitx5/skin/matugen/prev.png".source = "${fcitx5Pkg}/share/fcitx5/themes/default/prev.png";
  home.file.".local/share/fcitx5/skin/matugen/radio.png".source = "${fcitx5Pkg}/share/fcitx5/themes/default/radio.png";
}
