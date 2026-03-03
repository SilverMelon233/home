{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.dms
  ];

  programs.dms-shell = {
    enable = true;
    quickshell.package = pkgs.quickshell;
  };
}
