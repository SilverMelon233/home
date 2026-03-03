{ userConfig, ... }:
let
  style = userConfig.catppuccinStyle or "mocha";
  theme = import ./${style}.nix;
in
{
  catppuccin = theme;
}