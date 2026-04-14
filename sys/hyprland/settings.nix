{ pkgs, ... }:
{
  home.packages = [ pkgs.glib ];

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland.extraConfig = ''
    # ── DMS-managed sources ─────────────────────────────────────────────────
    source=~/.config/hypr/dms/layout.conf
    source=~/.config/hypr/dms/outputs.conf
    source=~/.config/hypr/dms/windowrules.conf
    source=~/.config/hypr/dms/cursor.conf

    # ── Core settings ────────────────────────────────────────────────────────
    $mod=SUPER

    general {
      layout=hy3
    }

    # ── Keybindings ──────────────────────────────────────────────────────────
    bind=$mod, Tab, hyprexpo:expo, toggle
    bind=$mod, B, exec, brave
    bind=$mod, Return, exec, ghostty
    bind=$mod, Q, hy3:killactive
    bind=$mod, Space, exec, dms ipc call spotlight toggle
    bind=$mod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit
    bind=$mod, L, exec, dms ipc lock lock
    bind=$mod, F, fullscreen, 1
    bind=$mod, T, hy3:changegroup, toggletab
    bind=$mod, C, hy3:changegroup, opposite
    bind=$mod, H, hy3:makegroup, h
    bind=$mod, V, hy3:makegroup, v
    bind=$mod, A, hy3:movefocus, l
    bind=$mod, S, hy3:movefocus, d
    bind=$mod, W, hy3:movefocus, u
    bind=$mod, D, hy3:movefocus, r
    bind=$mod SHIFT, A, hy3:movewindow, l
    bind=$mod SHIFT, S, hy3:movewindow, d
    bind=$mod SHIFT, W, hy3:movewindow, u
    bind=$mod SHIFT, D, hy3:movewindow, r
    bind=$mod CTRL, S, exec, dms screenshot
    bind=$mod, comma, hy3:focustab, l, wrap
    bind=$mod, period, hy3:focustab, r, wrap
    bind=$mod ALT, A, resizeactive, -10 0
    bind=$mod ALT, S, resizeactive, 0 10
    bind=$mod ALT, W, resizeactive, 0 -10
    bind=$mod ALT, D, resizeactive, 10 0
    bind=$mod, 1, workspace, 1
    bind=$mod SHIFT, 1, hy3:movetoworkspace, 1
    bind=$mod, 2, workspace, 2
    bind=$mod SHIFT, 2, hy3:movetoworkspace, 2
    bind=$mod, 3, workspace, 3
    bind=$mod SHIFT, 3, hy3:movetoworkspace, 3
    bind=$mod, 4, workspace, 4
    bind=$mod SHIFT, 4, hy3:movetoworkspace, 4
    bind=$mod, 5, workspace, 5
    bind=$mod SHIFT, 5, hy3:movetoworkspace, 5
    bind=$mod, 6, workspace, 6
    bind=$mod SHIFT, 6, hy3:movetoworkspace, 6
    bind=$mod, 7, workspace, 7
    bind=$mod SHIFT, 7, hy3:movetoworkspace, 7
    bind=$mod, 8, workspace, 8
    bind=$mod SHIFT, 8, hy3:movetoworkspace, 8
    bind=$mod, 9, workspace, 9
    bind=$mod SHIFT, 9, hy3:movetoworkspace, 9
    bind=$mod, 0, workspace, 10
    bind=$mod SHIFT, 0, hy3:movetoworkspace, 10
    bind=, mouse:275, workspace, e+1
    bind=, mouse:276, workspace, e-1

    # ── Startup ──────────────────────────────────────────────────────────────
    exec-once=fcitx5
    exec-once=dms run
  '';
}
