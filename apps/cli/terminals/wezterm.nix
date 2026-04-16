{ pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      
      return {
        font = wezterm.font 'JetBrainsMono Nerd Font',
        font_size = 13,
        
        window_padding = {
          left = 8,
          right = 8,
          top = 8,
          bottom = 8,
        },
        
        enable_tab_bar = false,
        window_decorations = "RESIZE",
        
        -- Load matugen-generated colors
        colors = dofile(os.getenv('HOME') .. '/.config/wezterm/colors/matugen.lua'),
      }
    '';
  };
}