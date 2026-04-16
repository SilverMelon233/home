{ pkgs, ... }:
{
  home.username = "ytr";
  home.homeDirectory = "/home/ytr";

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    TERMINAL = "ghostty";
    EDITOR = "codium";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum";
    NIXOS_OZONE_WL = "1";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  imports = [
    ./apps
    ./system
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
