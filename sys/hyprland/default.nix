{ ... }:
{
  imports = [
    ./hyprland-core.nix
    ./session-variables.nix
    ./packages-hyprland.nix
    ./settings-source.nix
    ./settings-general.nix
    ./settings-decoration.nix
    ./settings-gestures.nix
    ./keybinds.nix
    ./exec-once.nix
    ./plugins
    ./xremap.nix
  ];
}
