{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vivaldi
    vivaldi-ffmpeg-codecs  # Proprietary codec support
  ];

  # Matugen generates ~/.config/matugen/templates-output/vivaldi.css
  # To apply theme in Vivaldi:
  # 1. Open Vivaldi Settings → Appearance → Theme → Edit Theme
  # 2. Enable "Custom CSS" and paste the path to generated CSS
  # 3. Or manually copy: ~/.config/matugen/templates-output/vivaldi.css to Vivaldi profile
}