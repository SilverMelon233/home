{
  pkgs,
  ...
}:
{
  home.packages = [
    pkgs.quickshell
    pkgs.dms-shell
  ];

  # programs.dms-shell = {
  #   enable = true;
  #   quickshell.package = pkgs.quickshell;
  # };
}
