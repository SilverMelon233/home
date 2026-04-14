{ pkgs,
  lib,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    # Extensions are installed manually via the OpenVSX marketplace.
    # VSCodium ships with OpenVSX as default registry — no extra config needed.
    profiles.default = {
      extensions = [ ];

      userSettings = {
        # Editor
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'monospace'";
        "editor.fontSize" = 14;
        "editor.fontLigatures" = true;
        "editor.formatOnSave" = true;
        "editor.minimap.enabled" = false;
        "editor.renderWhitespace" = "boundary";
        "editor.tabSize" = 2;
        "editor.wordWrap" = "on";
        "editor.cursorBlinking" = "smooth";
        "editor.cursorSmoothCaretAnimation" = "on";

        # Files
        "files.autoSave" = "onFocusChange";
        "files.trimTrailingWhitespace" = true;

        # Terminal
        "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
        "terminal.integrated.fontSize" = 13;
        "terminal.integrated.defaultProfile.linux" = "fish";
        "terminal.integrated.profiles.linux" = {
          fish = {
            path = "${lib.getExe pkgs.fish}";
            icon = "terminal-linux";
          };
        };

        # Workbench
        "workbench.startupEditor" = "none";
        # DMS 动态主题 — dms 自动安装扩展并更新 dankshell-*.json
        # 扩展名：DankLinux.dms-theme，主题名：Dynamic Base16 DankShell
        "workbench.colorTheme" = "Dynamic Base16 DankShell";
        "workbench.iconTheme" = "vscode-icons";

        # Locale
        "locale" = "zh-cn";

        # Telemetry
        "telemetry.telemetryLevel" = "off";
        "update.mode" = "none";
      };
    };
  };
}
