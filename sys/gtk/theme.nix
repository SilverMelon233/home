{
  pkgs,
  userConfig,
  ...
}:
let
  style = userConfig.catppuccinStyle;

  catppuccinThemeMap = {
    latte = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        variant = "latte";
      };
      name = "catppuccin-latte-mauve-compact";
    };
    frappe = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        variant = "frappe";
      };
      name = "catppuccin-frappe-mauve-compact";
    };
    macchiato = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        variant = "macchiato";
      };
      name = "catppuccin-macchiato-mauve-compact";
    };
    mocha = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        variant = "mocha";
      };
      name = "catppuccin-mocha-mauve-compact";
    };
  };

  themeConfig = catppuccinThemeMap.${style};
in
{
  home.sessionVariables.GTK_THEME = themeConfig.name;
  home.sessionVariables.GIO_EXTRA_MODULES = "/run/current-system/sw/lib/gio/modules";

  gtk = {
    enable = true;
    theme = {
      package = themeConfig.package;
      name = themeConfig.name;
    };

    iconTheme = {
      package = pkgs.candy-icons;
      name = "candy-icons";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
}