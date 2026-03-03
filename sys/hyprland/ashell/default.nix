{ pkgs, config, ... }:
{
  home.packages = [ pkgs.ashell ];

  xdg.configFile."ashell/config.toml" = {
    source = ./config.toml;
  };
}
