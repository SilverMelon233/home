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
    }

    input type:keyboard {
      xkb_layout us
    }

    # ── Appearance ────────────────────────────────────────────────────────────
    gaps inner 8
    default_border pixel 2

    # ── Matugen colors ────────────────────────────────────────────────────────
    include ~/.config/sway/matugen-colors.conf

    # ── DMS-managed sources ───────────────────────────────────────────────────
    include ~/.config/sway/dms/*

    # ── Startup ───────────────────────────────────────────────────────────────
    exec fcitx5
    exec dms run

    # ── Environment ───────────────────────────────────────────────────────────
    set $env_qt QT_QPA_PLATFORMTHEME=qt6ct QT_STYLE_OVERRIDE=kvantum

    # ── Keybindings ──────────────────────────────────────────────────────────
    # All bindings mirror Hyprland equivalents.

    # ── Applications ──────────────────────────────────────────────────────────
    # Hyprland: bind=$mod, Return, exec, ghostty
    bindsym $mod+Return exec ghostty
    # Hyprland: bind=$mod, B, exec, brave
    bindsym $mod+B exec brave
    # Hyprland: bind=$mod, Space, exec, dms ipc call spotlight toggle
    bindsym $mod+Space exec $menu

    # ── Window management ─────────────────────────────────────────────────────
    # Hyprland: bind=$mod, Q, killactive
    bindsym $mod+Q kill
    # Hyprland: bind=$mod, F, fullscreen, 1  (maximize)
    bindsym $mod+F fullscreen enable
    # Hyprland: bind=$mod SHIFT, F, fullscreen  (true fullscreen)
    bindsym $mod+Shift+F fullscreen toggle global
    # Hyprland: bind=$mod, C, centerwindow
    bindsym $mod+C move position center
    # Hyprland: bind=$mod, M, exit
    bindsym $mod+M exec swaynag -t warning -m 'Exit sway?' -b 'Yes' 'swaymsg exit'
    # Hyprland: bind=$mod, L, exec, dms ipc lock lock
    bindsym $mod+L exec dms ipc lock lock
    # Hyprland: bind=$mod CTRL, S, exec, dms screenshot
    bindsym $mod+Ctrl+S exec dms screenshot

    # ── Focus (ASWD) ──────────────────────────────────────────────────────────
    # Hyprland: bind=$mod, A/D/W/S, movefocus, l/r/u/d
    bindsym $mod+A focus left
    bindsym $mod+D focus right
    bindsym $mod+W focus up
    bindsym $mod+S focus down

    # ── Move windows (SHIFT+ASWD) ─────────────────────────────────────────────
    # Hyprland: bind=$mod SHIFT, A/D/W/S, movewindow, l/r/u/d
    bindsym $mod+Shift+A move left
    bindsym $mod+Shift+D move right
    bindsym $mod+Shift+W move up
    bindsym $mod+Shift+S move down

    # ── Resize (ALT+ASWD) ─────────────────────────────────────────────────────
    # Hyprland: bind=$mod ALT, A/D/W/S, resizeactive, ±10 0 / 0 ±10
    bindsym $mod+Alt+A resize shrink width 10px
    bindsym $mod+Alt+D resize grow width 10px
    bindsym $mod+Alt+W resize shrink height 10px
    bindsym $mod+Alt+S resize grow height 10px

    # ── Layout ────────────────────────────────────────────────────────────────
    # Hyprland: bind=$mod, T, togglegroup
    bindsym $mod+T layout toggle tabbed splith
    # Hyprland: bind=$mod, H, makegroup h (split horizontal)
    bindsym $mod+H splith
    # Hyprland: bind=$mod, V, makegroup v (split vertical)
    bindsym $mod+V splitv

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

    # ── Mode: resize ──────────────────────────────────────────────────────────
    mode "resize" {
      bindsym A resize shrink width 10px
      bindsym D resize grow width 10px
      bindsym W resize shrink height 10px
      bindsym S resize grow height 10px
      bindsym Return mode "default"
      bindsym Escape mode "default"
    }
  '';
}
