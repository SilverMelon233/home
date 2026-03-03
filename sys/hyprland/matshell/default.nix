{ pkgs, inputs, ... }:
{
  imports = [
    inputs.matshell.homeManagerModules.default
  ];

  programs.matshell = {
    enable = true;
    autostart = false;
    # Compositor you are using. Defaults to hyprland.
    compositor = "hyprland";
    # To use the hyprland/hyprlock templates, you would still need to
    # import the generated files and add the color aliases to your config as desired.
    matugenConfig = true;
  };
}
