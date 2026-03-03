{
  pkgs,
  userConfig,
  ...
}:
{
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio;
    plugins = [
      (pkgs.obs-studio-plugins.distroav.override {
        ndi-6 = pkgs.ndi-6.overrideAttrs (oldAttrs: {
          pname = "ndi-6";
          version = "6.2.1.0";
          majorVersion = "6";
          installerName = "Install_NDI_SDK_v6_Linux";
          src = pkgs.fetchurl {
            url = "https://downloads.ndi.tv/SDK/NDI_SDK_Linux/Install_NDI_SDK_v6_Linux.tar.gz";
            hash = "sha256-wLXfFzJIiGJ7ZSF8e4UNdQKHxS4z6WSF4qprESKeYD4=";
          };
        });
      })
    ];
  };
}