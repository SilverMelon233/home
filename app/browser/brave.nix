{ pkgs,
  ...
}:
{
  programs.brave = {
    enable = true;
    package = pkgs.brave;
    # No theme extensions — colors come from GTK/matugen
    extensions = [ ];
    commandLineArgs = [
      "--disable-features=WebRtcAllowInputVolumeAdjustment"
      "--ozone-platform=wayland"
    ];
  };
}
