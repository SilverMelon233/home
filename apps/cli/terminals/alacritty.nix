{ pkgs, ... }:
{
  home.packages = [ pkgs.alacritty ];

  # Main config imports matugen-generated theme
  home.file.".config/alacritty/alacritty.toml".text = ''
    import = ["~/.config/alacritty/themes/matugen.toml"]
    
    [font]
    normal.family = "JetBrainsMono Nerd Font"
    size = 13
    
    [window]
    padding.x = 8
    padding.y = 8
    decorations = "None"
    
    [cursor]
    style.shape = "Block"
    
    [selection]
    save_to_clipboard = true
  '';
}