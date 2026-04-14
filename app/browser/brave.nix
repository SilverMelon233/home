{
  pkgs-unstable,
  ...
}:
{
  programs.brave = {
    enable = true;
    package = pkgs-unstable.brave;
    # No theme extensions — colors come from GTK/matugen
    extensions = [ ];
    commandLineArgs = [
      "--disable-features=WebRtcAllowInputVolumeAdjustment"
      "--ozone-platform=wayland"
    ];
  };
}
