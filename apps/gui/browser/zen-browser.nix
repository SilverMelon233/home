{ pkgs, ... }:
{
  # Zen Browser is not in nixpkgs
  # Install manually from: https://github.com/zen-browser/zen-browser-desktop
  
  # Helper script for installation
  home.file.".local/bin/zen-browser-install".text = ''
    #!/bin/sh
    echo "=== Zen Browser Installation Helper ==="
    echo ""
    echo "Zen Browser is not available in nixpkgs."
    echo ""
    echo "Manual installation options:"
    echo ""
    echo "1. Download from GitHub releases:"
    echo "   https://github.com/zen-browser/zen-browser-desktop/releases"
    echo ""
    echo "2. Use AppImage:"
    echo "   wget https://github.com/zen-browser/zen-browser-desktop/releases/latest/download/zen-browser-x86_64.AppImage"
    echo "   chmod +x zen-browser-x86_64.AppImage"
    echo "   ./zen-browser-x86_64.AppImage"
    echo ""
    echo "3. For matugen theme, copy userChrome.css to:"
    echo "   ~/.zen-browser/<profile>/chrome/userChrome.css"
    echo ""
    echo "The matugen template is available at:"
    echo "   ~/.config/matugen/templates-output/zen-userchrome.css"
  '';
}