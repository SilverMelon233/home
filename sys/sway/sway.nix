{ pkgs, ... }:
{
  home.packages = with pkgs; [
    sway
    swaybg
    xdg-desktop-portal-wlr
  ];

  home.file.".config/sway/config".text = ''
    # ── Variables ─────────────────────────────────────────────────────────────
    set $mod Mod4
    set $menu dms ipc call spotlight toggle

    # ── Input ─────────────────────────────────────────────────────────────────
    input type:touchpad {
      tap enabled
      natural_scroll enabled
      dwt enabled
      events enabled
    }

    input type:keyboard {
      xkb_layout us
    }

    # ── Appearance ────────────────────────────────────────────────────────────
    gaps inner 8
    default_border pixel 2
    focus_follows_mouse yes
    mouse_warping container

    # ── Disable swaybar (DMS provides the bar) ────────────────────────────────
    bar {
      mode invisible
    }

    # ── Matugen colors ────────────────────────────────────────────────────────
    include ~/.config/sway/matugen-colors.conf

    # ── DMS-managed sources ───────────────────────────────────────────────────
    # NOTE: DMS does not currently generate sway files. Uncomment when available:
    # include ~/.config/sway/dms/*

    # ── Startup ───────────────────────────────────────────────────────────────
    exec fcitx5
    exec dms run

    # ── Environment ───────────────────────────────────────────────────────────
    exec_always systemctl --user import-environment QT_QPA_PLATFORMTHEME QT_STYLE_OVERRIDE

    # ── Keybindings ──────────────────────────────────────────────────────────
    # All bindings mirror Hyprland equivalents. Sway uses lowercase key names.

    # ── Applications ──────────────────────────────────────────────────────────
    # Hyprland: bind=$mod, Return, exec, ghostty
    bindsym $mod+Return exec ghostty
    # Hyprland: bind=$mod, B, exec, brave
    bindsym $mod+b exec brave
    # Hyprland: bind=$mod, Space, exec, dms ipc call spotlight toggle
    bindsym $mod+Space exec $menu

    # ── Window management ─────────────────────────────────────────────────────
    # Reload config
    bindsym $mod+Shift+c reload
    # Hyprland: bind=$mod, Q, killactive
    bindsym $mod+q kill
    # Hyprland: bind=$mod, F, fullscreen, 1  (maximize)
    bindsym $mod+f fullscreen enable
    # Hyprland: bind=$mod SHIFT, F, fullscreen  (true fullscreen)
    bindsym $mod+Shift+f fullscreen toggle global
    # Hyprland: bind=$mod, C, centerwindow
    bindsym $mod+c move position center
    # Hyprland: bind=$mod, M, exit
    bindsym $mod+m exec swaynag -t warning -m 'Exit sway?' -b 'Yes' 'swaymsg exit'
    # Hyprland: bind=$mod, L, exec, dms ipc lock lock
    bindsym $mod+l exec dms ipc lock lock
    # Hyprland: bind=$mod CTRL, S, exec, dms screenshot
    bindsym $mod+Ctrl+s exec dms screenshot

    # ── Focus (ASWD) ──────────────────────────────────────────────────────────
    # Hyprland: bind=$mod, A/D/W/S, movefocus, l/r/u/d
    bindsym $mod+a focus left
    bindsym $mod+d focus right
    bindsym $mod+w focus up
    bindsym $mod+s focus down

    # ── Move windows (SHIFT+ASWD) ─────────────────────────────────────────────
    # Hyprland: bind=$mod SHIFT, A/D/W/S, movewindow, l/r/u/d
    bindsym $mod+Shift+a move left
    bindsym $mod+Shift+d move right
    bindsym $mod+Shift+w move up
    bindsym $mod+Shift+s move down

    # ── Resize (ALT+ASWD) ─────────────────────────────────────────────────────
    # Hyprland: bind=$mod ALT, A/D/W/S, resizeactive, ±10 0 / 0 ±10
    bindsym $mod+Alt+a resize shrink width 10px
    bindsym $mod+Alt+d resize grow width 10px
    bindsym $mod+Alt+w resize shrink height 10px
    bindsym $mod+Alt+s resize grow height 10px

    # ── Layout ────────────────────────────────────────────────────────────────
    # Hyprland: bind=$mod, T, togglegroup
    bindsym $mod+t layout toggle tabbed splith
    # Hyprland: bind=$mod, H, makegroup h (split horizontal)
    bindsym $mod+h splith
    # Hyprland: bind=$mod, V, makegroup v (split vertical)
    bindsym $mod+v splitv
    # Toggle between horizontal and vertical split
    bindsym $mod+e layout toggle split

    # ── Tab navigation ────────────────────────────────────────────────────────
    # Hyprland: bind=$mod, comma/period, changegroupactive, b/f
    bindsym $mod+comma focus parent
    bindsym $mod+period focus child

    # ── Workspaces 1–10 ──────────────────────────────────────────────────────
    # Hyprland: bind=$mod, 1-9, workspace, 1-9
    bindsym $mod+1 workspace 1
    bindsym $mod+2 workspace 2
    bindsym $mod+3 workspace 3
    bindsym $mod+4 workspace 4
    bindsym $mod+5 workspace 5
    bindsym $mod+6 workspace 6
    bindsym $mod+7 workspace 7
    bindsym $mod+8 workspace 8
    bindsym $mod+9 workspace 9
    # Hyprland: bind=$mod, 0, workspace, 10
    bindsym $mod+0 workspace 10

    # Hyprland: bind=$mod SHIFT, 1-9, movetoworkspace, 1-9
    bindsym $mod+Shift+1 move container to workspace 1
    bindsym $mod+Shift+2 move container to workspace 2
    bindsym $mod+Shift+3 move container to workspace 3
    bindsym $mod+Shift+4 move container to workspace 4
    bindsym $mod+Shift+5 move container to workspace 5
    bindsym $mod+Shift+6 move container to workspace 6
    bindsym $mod+Shift+7 move container to workspace 7
    bindsym $mod+Shift+8 move container to workspace 8
    bindsym $mod+Shift+9 move container to workspace 9
    # Hyprland: bind=$mod SHIFT, 0, movetoworkspace, 10
    bindsym $mod+Shift+0 move container to workspace 10

    # ── Mouse side buttons ────────────────────────────────────────────────────
    # Hyprland: bind=, mouse:275/276, workspace, e+1/e-1
    bindsym --whole-window button9 workspace next_on_output
    bindsym --whole-window button8 workspace prev_on_output

    # ── Touchpad gestures ─────────────────────────────────────────────────────
    # Three-finger swipe left/right: switch workspace
    bindgesture swipe:3:left workspace prev
    bindgesture swipe:3:right workspace next
    # Three-finger swipe up/down: toggle fullscreen
    bindgesture swipe:3:up fullscreen toggle
    bindgesture swipe:3:down fullscreen toggle
    # Four-finger swipe: resize (like Hyprland)
    bindgesture swipe:4:left resize shrink width 20px
    bindgesture swipe:4:right resize grow width 20px
    bindgesture swipe:4:up resize shrink height 20px
    bindgesture swipe:4:down resize grow height 20px

    # ── Lid switch ────────────────────────────────────────────────────────────
    bindswitch lid:on output eDP-1 disable
    bindswitch lid:off output eDP-1 enable
  '';
}
