{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # C/C++ compilers (clang preferred, gcc available via nix-shell)
    clang
    clang-tools  # clang-format, clang-tidy
    cmake
    gnumake
    pkg-config
    
    # For gcc, use: nix-shell -p gcc
    # Or install separately to avoid c++ binary conflict with clang
  ];
}