{ ... }:
{
  # All hyprland plugins (hyprexpo, hyprfocus, hyprbars, borders-plus-plus)
  # are at version 0.53.0 in nixpkgs unstable and do not compile against
  # hyprland 0.54.3. Re-enable once nixpkgs updates the plugins.
  imports = [ ];
}
