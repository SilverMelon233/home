{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };
    settings = {
      window_padding_width = 8;
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      # Colors loaded from matugen-generated theme file
      include = "~/.config/kitty/themes/Matugen.conf";
    };
    # Shell integration
    shellIntegration.enableFishIntegration = true;
  };
}
