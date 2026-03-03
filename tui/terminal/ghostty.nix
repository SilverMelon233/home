{
  pkgs,
  userConfig,
  ...
}:
let
  colorTheme =
    {
      latte = "Catppuccin Latte";
      frappe = "Catppuccin Frappe";
      macchiato = "Catppuccin Macchiato";
      mocha = "Catppuccin Mocha";
    }
    .${userConfig.catppuccinStyle};
in
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;

    enableBashIntegration = true;
    enableFishIntegration = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13;
      window-decoration = "server";
      theme = colorTheme;
    };
  };
}
