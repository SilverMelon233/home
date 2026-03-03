{
  pkgs,
  userConfig,
  ...
}:
let
  style = userConfig.catppuccinStyle;

  catppuccinCursorMap = {
    latte = {
      package = pkgs.catppuccin-cursors.latteMauve;
      name = "Catppuccin-Latte-Mauve-Cursors";
    };
    frappe = {
      package = pkgs.catppuccin-cursors.frappeMauve;
      name = "Catppuccin-Frappe-Mauve-Cursors";
    };
    macchiato = {
      package = pkgs.catppuccin-cursors.macchiatoMauve;
      name = "Catppuccin-Macchiato-Mauve-Cursors";
    };
    mocha = {
      package = pkgs.catppuccin-cursors.mochaMauve;
      name = "Catppuccin-Mocha-Mauve-Cursors";
    };
  };

  cursorConfig = catppuccinCursorMap.${style};
in
{
  home.sessionVariables.XCURSOR_THEME = cursorConfig.name;

  home.pointerCursor = {
    gtk.enable = true;
    package = cursorConfig.package;
    name = cursorConfig.name;
    size = 24;
  };
}