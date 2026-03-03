{
  pkgs,
  userConfig,
  ...
}:
{
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "papirus-icon-theme";
    };
  };
}
