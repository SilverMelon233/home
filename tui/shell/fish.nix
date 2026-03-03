{
  ...
}:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Initialize starship
      starship init fish | source
    '';
    plugins = [ ];
  };
}
