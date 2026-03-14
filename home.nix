{
  pkgs,
  userConfig,
  ...
}:
{
  home.username = "ytr";
  home.homeDirectory = "/home/ytr";

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    TERMINAL = "ghostty";
    EDITOR = "zeditor";
  };

  imports = [
    ./app
    ./cli
    ./tui
    ./ide
    ./sys
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
