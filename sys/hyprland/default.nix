{ ... }:
{
  imports = [
    ./hyprland-core.nix
    ./session-variables.nix
    ./theme-cursor.nix
    ./packages-hyprland.nix
    ./settings-source.nix
    ./settings-general.nix
    ./settings-decoration.nix
    ./settings-gestures.nix
    ./keybinds.nix
    ./exec-once.nix
    ./plugins
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprlock.nix
    # ./ashell
    # ./ironbar
    # ./matshell
    ./hyprpanel
    ./walker.nix
    ./xremap.nix
  ];
}
