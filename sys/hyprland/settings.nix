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
      layout=dwindle
    }

    dwindle {
      pseudotile=false
      preserve_split=true
      force_split=2
    }

    # ── Keybindings ──────────────────────────────────────────────────────────
    bind=$mod, B, exec, brave
    bind=$mod, Return, exec, ghostty
    bind=$mod, Q, killactive
    bind=$mod, Space, exec, dms ipc call spotlight toggle
    bind=$mod, M, exec, zenity --question --text='Exit Hyprland?' --title='Confirm' && hyprshutdown
    bind=$mod, L, exec, dms ipc lock lock
    bind=$mod, F, fullscreen, 1
    bind=$mod SHIFT, F, fullscreen, 0
    bind=$mod, T, togglegroup
    bind=$mod, C, centerwindow
    bind=$mod, A, movefocus, l
    bind=$mod, S, movefocus, d
    bind=$mod, W, movefocus, u
    bind=$mod, D, movefocus, r
    bind=$mod SHIFT, A, movewindow, l
    bind=$mod SHIFT, S, movewindow, d
    bind=$mod SHIFT, W, movewindow, u
    bind=$mod SHIFT, D, movewindow, r
    bind=$mod CTRL, S, exec, dms screenshot
    bind=$mod, comma, changegroupactive, b
    bind=$mod, period, changegroupactive, f
    bind=$mod ALT, A, resizeactive, -10 0
    bind=$mod ALT, S, resizeactive, 0 10
    bind=$mod ALT, W, resizeactive, 0 -10
    bind=$mod ALT, D, resizeactive, 10 0
    bind=$mod, 1, workspace, 1
    bind=$mod SHIFT, 1, movetoworkspace, 1
    bind=$mod, 2, workspace, 2
    bind=$mod SHIFT, 2, movetoworkspace, 2
    bind=$mod, 3, workspace, 3
    bind=$mod SHIFT, 3, movetoworkspace, 3
    bind=$mod, 4, workspace, 4
    bind=$mod SHIFT, 4, movetoworkspace, 4
    bind=$mod, 5, workspace, 5
    bind=$mod SHIFT, 5, movetoworkspace, 5
    bind=$mod, 6, workspace, 6
    bind=$mod SHIFT, 6, movetoworkspace, 6
    bind=$mod, 7, workspace, 7
    bind=$mod SHIFT, 7, movetoworkspace, 7
    bind=$mod, 8, workspace, 8
    bind=$mod SHIFT, 8, movetoworkspace, 8
    bind=$mod, 9, workspace, 9
    bind=$mod SHIFT, 9, movetoworkspace, 9
    bind=$mod, 0, workspace, 10
    bind=$mod SHIFT, 0, movetoworkspace, 10
    bind=, mouse:275, workspace, e+1
    bind=, mouse:276, workspace, e-1

    # ── Touchpad gestures ────────────────────────────────────────────────────
    # Three-finger left/right: 1:1 continuous workspace swipe (built-in)
    gesture = 3, left,  workspace
    gesture = 3, right, workspace
    # Three-finger up/down: toggle true fullscreen (both = toggle)
    gesture = 3, up,   fullscreen
    gesture = 3, down, fullscreen
    # Four-finger any direction: continuous 1:1 window resize (built-in)
    gesture = 4, left,  resize
    gesture = 4, right, resize
    gesture = 4, up,    resize
    gesture = 4, down,  resize

    # ── Startup ──────────────────────────────────────────────────────────────
    exec-once=fcitx5
    # dms run is started by sys/shell/dms.nix
  '';
}
