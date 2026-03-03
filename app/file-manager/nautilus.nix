{
  pkgs,
  ...
}:
{
  # Install Nautilus with Catppuccin theme support
  home.packages = with pkgs; [
    nautilus
  ];
}
