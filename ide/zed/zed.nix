{
  pkgs,
  lib,
  userConfig,
  ...
}:
let
  catppuccinThemeName =
    {
      latte = "Catppuccin Latte";
      frappe = "Catppuccin Frappé";
      macchiato = "Catppuccin Macchiato";
      mocha = "Catppuccin Mocha";
    }
    .${userConfig.catppuccinStyle};
in
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "catppuccin"
      "catppuccin-icons"
    ]
    ++ userConfig.zed-extensions;
    userSettings = {
      theme = catppuccinThemeName;
      icon_theme = catppuccinThemeName;

      ui_font_size = 14;
      buffer_font_size = 14;
      buffer_font_family = "JetBrains Mono";

      auto_update = false;

      base_keymap = "VSCode";

      tab_size = 2;
      ensure_final_newline_on_save = true;
      autosave = "on_focus_change";
      soft_wrap = "editor_width";

      cursor_blink = true;
      cursor_shape = "bar";

      minimap = {
        show = "always";
      };

      gutter = {
        line_numbers = true;
      };

      terminal = {
        font_size = 13;
        shell = {
          program = "${lib.getExe pkgs.fish}";
        };
      };
    };
  };
}
