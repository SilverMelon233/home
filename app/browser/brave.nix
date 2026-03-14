{
  pkgs,
  pkgs-unstable,
  userConfig,
  ...
}:
let
  catppuccinThemeIds = {
    latte = "jhjnalhegpceacdhbplhnakmkdliaddd";
    frappe = "olhelnoplefjdmncknfphenjclimckaf";
    macchiato = "cmpdlhmnmjhihmcfnigoememnffkimlk";
    mocha = "bkkmolkhemgaeaeggcmfbghljjjoofoh";
  };

  style = userConfig.catppuccinStyle or "latte";
  isDarkMode = style != "latte";

  allowedExtensions = [
    catppuccinThemeIds.${style}
  ];
in
{
  programs.brave = {
    enable = true;
    package = pkgs-unstable.brave;
    extensions = [
      { id = catppuccinThemeIds.${style}; }
    ];
    commandLineArgs = [
      "--disable-features=WebRtcAllowInputVolumeAdjustment"
      "--force-extension-access"
    ];
    # ++ pkgs.lib.optional isDarkMode "--force-dark-mode";
  };

  home.activation.cleanupBraveExtensions = ''
    externalExtensionsDir="$HOME/.config/BraveSoftware/Brave-Browser/External Extensions"

    if [ -d "$externalExtensionsDir" ]; then
      for extFile in "$externalExtensionsDir"/*.json; do
        if [ -f "$extFile" ]; then
          extId=$(basename "$extFile" .json)
          shouldRemove=true
          for allowed in ${pkgs.lib.concatStringsSep " " allowedExtensions}; do
            if [ "$extId" = "$allowed" ]; then
              shouldRemove=false
              break
            fi
          done
          if [ "$shouldRemove" = true ]; then
            rm -f "$extFile"
          fi
        fi
      done
    fi
  '';
}
