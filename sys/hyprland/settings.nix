{ pkgs, ... }:
{
  home.packages = [ pkgs.glib ];
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland.settings = {
    source = [
      "~/.config/hypr/dms/layout.conf"
      "~/.config/hypr/dms/outputs.conf"
      "~/.config/hypr/dms/windowrules.conf"
    ];

    general = {
      layout = "hy3";
      # gaps_in = 2;
      # gaps_out = 5;
      # border_size = 1;
      # "col.active_border" = "rgba(ffffffcc)";
    };

    # decoration = {
    #   rounding = 10;
    #   blur = {
    #     enabled = true;
    #     size = 8;
    #   };
    # };

    "$mod" = "SUPER";

    bind = [
      "$mod, Tab, hyprexpo:expo, toggle"

      "$mod, B, exec, brave"
      "$mod, Return, exec, ghostty"
      "$mod, Q, hy3:killactive"
      "$mod, Space, exec, dms ipc call spotlight toggle"
      "$mod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
      "$mod, L, exec, dms lock lock"
      "$mod, F, fullscreen, 1"

      "$mod, T, hy3:changegroup, toggletab"
      "$mod, C, hy3:changegroup, opposite"
      "$mod, H, hy3:makegroup, h"
      "$mod, V, hy3:makegroup, v"

      "$mod, A, hy3:movefocus, l"
      "$mod, S, hy3:movefocus, d"
      "$mod, W, hy3:movefocus, u"
      "$mod, D, hy3:movefocus, r"

      "$mod SHIFT, A, hy3:movewindow, l"
      "$mod SHIFT, S, hy3:movewindow, d"
      "$mod SHIFT, W, hy3:movewindow, u"
      "$mod SHIFT, D, hy3:movewindow, r"

      "$mod CTRL, S, exec, dms screenshot"

      "$mod, comma, hy3:focustab, l, wrap"
      "$mod, period, hy3:focustab, r, wrap"

      "$mod ALT, A, resizeactive, -10 0"
      "$mod ALT, S, resizeactive, 0 10"
      "$mod ALT, W, resizeactive, 0 -10"
      "$mod ALT, D, resizeactive, 10 0"

      "$mod, 1, workspace, 1"
      "$mod SHIFT, 1, hy3:movetoworkspace, 1"
      "$mod, 2, workspace, 2"
      "$mod SHIFT, 2, hy3:movetoworkspace, 2"
      "$mod, 3, workspace, 3"
      "$mod SHIFT, 3, hy3:movetoworkspace, 3"
      "$mod, 4, workspace, 4"
      "$mod SHIFT, 4, hy3:movetoworkspace, 4"
      "$mod, 5, workspace, 5"
      "$mod SHIFT, 5, hy3:movetoworkspace, 5"
      "$mod, 6, workspace, 6"
      "$mod SHIFT, 6, hy3:movetoworkspace, 6"
      "$mod, 7, workspace, 7"
      "$mod SHIFT, 7, hy3:movetoworkspace, 7"
      "$mod, 8, workspace, 8"
      "$mod SHIFT, 8, hy3:movetoworkspace, 8"
      "$mod, 9, workspace, 9"
      "$mod SHIFT, 9, hy3:movetoworkspace, 9"
      "$mod, 0, workspace, 10"
      "$mod SHIFT, 0, hy3:movetoworkspace, 10"

      ", mouse:275, workspace, e+1"
      ", mouse:276, workspace, e-1"
    ];
  };
}
