{
  ...
}:
{
  programs.nushell = {
    enable = true;
    envFile.text = ''
      # Initialize starship
      let starship_cache = ($env.HOME | path join .cache/starship)
      $env.STARSHIP_CACHE = $starship_cache

      # Create cache directory
      mkdir $starship_cache

      # Create starship init file
      let starship_init_file = ($starship_cache | path join init.nu)
      starship init nu | save --force $starship_init_file
    '';

    loginFile.text = ''
      # Source starship initialization
      source ($env.STARSHIP_CACHE | path join init.nu)
    '';
  };
}
