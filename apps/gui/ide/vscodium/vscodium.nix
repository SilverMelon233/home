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
    };

    # User settings managed manually (non-read-only)
    # Default settings preserved in ~/.vscode-oss/User/settings.json manually
  };
}
