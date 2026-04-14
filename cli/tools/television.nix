{ pkgs, ... }:
{
  home.packages = [ pkgs.television ];

  # matugen generates ~/.config/television/themes/matugen.toml
  # Tell television to use it
  home.file.".config/television/config.toml".text = ''
    [ui]
    theme = "matugen"
  '';
}
