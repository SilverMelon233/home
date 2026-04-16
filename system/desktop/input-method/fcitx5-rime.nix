{ pkgs, ... }:
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
}
