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
}
