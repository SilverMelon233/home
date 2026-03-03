{
  pkgs,
  userConfig,
  ...
}:
# let
#   colorTheme =
#     {
#       latte = "catppuccin-frappe";
#       frappe = "catppuccin-frappe";
#       macchiato = "catppuccin-macchiato";
#       mocha = "catppuccin";
#     }
#     .${userConfig.catppuccinStyle};
# in
{
  programs.opencode = {
    enable = true;
    # settings.theme = colorTheme;
  };
}
