{
  pkgs,
  ...
}:
{
  # services.xremap.enable = true;
  # services.xremap.config = {
  #   modmap = [
  #     {
  #       name = "CapsLock to F13 (short) and F14 (long)";
  #       remap = {
  #         CapsLock = {
  #           held = "F14";
  #           alone = "F13";
  #         };
  #       };
  #     }
  #   ];
  #   keymap = [
  #   ];
  # };

  home.packages = [
    pkgs.xremap
    pkgs.kitty
  ];
}
