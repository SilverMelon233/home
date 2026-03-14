{
  pkgs-unstable,
  userConfig,
  ...
}:
let
  catppuccinColorTheme =
    {
      latte = "Catppuccin Latte";
      frappe = "Catppuccin Frappé";
      macchiato = "Catppuccin Macchiato";
      mocha = "Catppuccin Mocha";
    }
    .${userConfig.catppuccinStyle};
  catppuccinIconTheme =
    {
      latte = "catppuccin-latte";
      frappe = "catppuccin-frappe";
      macchiato = "catppuccin-macchiato";
      mocha = "catppuccin-mocha";
    }
    .${userConfig.catppuccinStyle};
in
{
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode;
    profiles.default.extensions =
      with pkgs-unstable.nix-vscode-extensions.vscode-marketplace;
      [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
      ]
      ++ userConfig.vscode-extensions;

    profiles.default.userSettings = {
      "workbench.colorTheme" = catppuccinColorTheme;
      "workbench.iconTheme" = catppuccinIconTheme;
      "editor.fontFamily" = "'JetBrains Mono', 'monospace'";
      "editor.fontSize" = 14;
      "editor.fontWeight" = "normal";
      "editor.minimap.enabled" = true;
      "editor.lineNumbers" = "on";
      "editor.cursorStyle" = "line";
      "locale.language" = userConfig.i18n.language;
      "files.autoSave" = "onFocusChange";
      "editor.wordWrap" = "on";
      "files.insertFinalNewline" = true;
      "files.trimTrailingWhitespace" = true;
      "editor.tabSize" = 2;
      "editor.insertSpaces" = true;
      "terminal.integrated.fontSize" = 13;
      "terminal.integrated.scrollback" = 10000;
      "workbench.startupEditor" = "none";
      "window.zoomLevel" = 0;
      "terminal.integrated.defaultProfile.linux" = "fish";
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "terminal.integrated.gpuAcceleration" = "off";
    };
  };
}
