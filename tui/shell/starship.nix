{
  ...
}:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings = {
      format = "$all";
      right_format = "$time";
      scan_timeout = 10;
      add_newline = true;
    };
  };
}
