{ pkgs, ... }:
{
  home.packages = with pkgs; [
    miracle-wm
    xdg-desktop-portal-wlr
    zenity
  ];

  home.file.".config/miracle-wm/config.yaml".text = ''
    # ── Action Key ────────────────────────────────────────────────────────
    action_key: meta

    # ── Input ─────────────────────────────────────────────────────────────
    input:
      keyboard:
        xkb_layout: us
      touchpad:
        tap: true
        natural_scroll: true
        disable_while_typing: true

    # ── Appearance ────────────────────────────────────────────────────────
    inner_gaps: 8
    outer_gaps: 8
    border:
      size: 2

    # ── Terminal ──────────────────────────────────────────────────────────
    terminal: ghostty

    # ── Resize Jump ───────────────────────────────────────────────────────
    resize_jump: 10

    # ── Environment Variables ─────────────────────────────────────────────
    environment:
      QT_QPA_PLATFORMTHEME: qt6ct
      QT_STYLE_OVERRIDE: kvantum
      NIXOS_OZONE_WL: "1"

    # ── Startup Apps ──────────────────────────────────────────────────────
    startup_apps:
      - command: fcitx5
      - command: dms run

    # ── Includes ──────────────────────────────────────────────────────────
    includes:
      - ~/.config/miracle-wm/matugen-colors.yaml

    # ── Override default keybinds to mirror Hyprland ──────────────────────
    default_action_overrides:
      # ── Applications ────────────────────────────────────────────────────
      # Hyprland: bind=$mod, Return, exec, ghostty
      - name: terminal
        action: down
        modifiers:
          - primary
        key: Return

      # Hyprland: bind=$mod, Q, killactive
      - name: quit_active_window
        action: down
        modifiers:
          - primary
        key: q

      # Hyprland: bind=$mod, F, fullscreen, 1 (maximize)
      - name: fullscreen
        action: down
        modifiers:
          - primary
        key: f

      # Hyprland: bind=$mod, H, makegroup h (split horizontal)
      - name: request_horizontal
        action: down
        modifiers:
          - primary
        key: h

      # Hyprland: bind=$mod, V, makegroup v (split vertical)
      - name: request_vertical
        action: down
        modifiers:
          - primary
        key: v

      # Hyprland: bind=$mod, A/D/W/S, movefocus, l/r/u/d
      - name: select_left
        action: down
        modifiers:
          - primary
        key: a

      - name: select_right
        action: down
        modifiers:
          - primary
        key: d

      - name: select_up
        action: down
        modifiers:
          - primary
        key: w

      - name: select_down
        action: down
        modifiers:
          - primary
        key: s

      # Hyprland: bind=$mod SHIFT, A/D/W/S, movewindow, l/r/u/d
      - name: move_left
        action: down
        modifiers:
          - primary
          - shift
        key: A

      - name: move_right
        action: down
        modifiers:
          - primary
          - shift
        key: D

      - name: move_up
        action: down
        modifiers:
          - primary
          - shift
        key: W

      - name: move_down
        action: down
        modifiers:
          - primary
          - shift
        key: S

      # Hyprland: bind=$mod, 1-9, workspace, 1-9
      - name: select_workspace_1
        action: down
        modifiers:
          - primary
        key: 1

      - name: select_workspace_2
        action: down
        modifiers:
          - primary
        key: 2

      - name: select_workspace_3
        action: down
        modifiers:
          - primary
        key: 3

      - name: select_workspace_4
        action: down
        modifiers:
          - primary
        key: 4

      - name: select_workspace_5
        action: down
        modifiers:
          - primary
        key: 5

      - name: select_workspace_6
        action: down
        modifiers:
          - primary
        key: 6

      - name: select_workspace_7
        action: down
        modifiers:
          - primary
        key: 7

      - name: select_workspace_8
        action: down
        modifiers:
          - primary
        key: 8

      - name: select_workspace_9
        action: down
        modifiers:
          - primary
        key: 9

      # Hyprland: bind=$mod, 0, workspace, 10
      - name: select_workspace_0
        action: down
        modifiers:
          - primary
        key: 0

      # Hyprland: bind=$mod SHIFT, 1-9, movetoworkspace, 1-9
      - name: move_to_workspace_1
        action: down
        modifiers:
          - primary
          - shift
        key: exclam

      - name: move_to_workspace_2
        action: down
        modifiers:
          - primary
          - shift
        key: at

      - name: move_to_workspace_3
        action: down
        modifiers:
          - primary
          - shift
        key: numbersign

      - name: move_to_workspace_4
        action: down
        modifiers:
          - primary
          - shift
        key: dollar

      - name: move_to_workspace_5
        action: down
        modifiers:
          - primary
          - shift
        key: percent

      - name: move_to_workspace_6
        action: down
        modifiers:
          - primary
          - shift
        key: asciicircum

      - name: move_to_workspace_7
        action: down
        modifiers:
          - primary
          - shift
        key: ampersand

      - name: move_to_workspace_8
        action: down
        modifiers:
          - primary
          - shift
        key: asterisk

      - name: move_to_workspace_9
        action: down
        modifiers:
          - primary
          - shift
        key: parenleft

      - name: move_to_workspace_0
        action: down
        modifiers:
          - primary
          - shift
        key: parenright

    # ── Custom actions for apps not covered by default overrides ──────────
    custom_actions:
      # Hyprland: bind=$mod, B, exec, brave
      - command: brave
        action: down
        modifiers:
          - primary
        key: b

      # Hyprland: bind=$mod, Space, exec, dms ipc call spotlight toggle
      - command: dms ipc call spotlight toggle
        action: down
        modifiers:
          - primary
        key: Space

      # Hyprland: bind=$mod SHIFT, F, fullscreen (true fullscreen)
      - command: miraclemsg -c "fullscreen"
        action: down
        modifiers:
          - primary
          - shift
        key: F

      # Hyprland: bind=$mod, C, centerwindow
      - command: miraclemsg -c "move_to_center"
        action: down
        modifiers:
          - primary
        key: c

      # Hyprland: bind=$mod, M, exit with confirm
      - command: zenity --question --text='Exit miracle?' --title='Confirm' && miraclemsg -c "quit"
        action: down
        modifiers:
          - primary
        key: m

      # Hyprland: bind=$mod, L, exec, dms ipc lock lock
      - command: dms ipc lock lock
        action: down
        modifiers:
          - primary
        key: l

      # Hyprland: bind=$mod CTRL, S, exec, dms screenshot
      - command: dms screenshot
        action: down
        modifiers:
          - primary
          - ctrl
        key: s

      # Hyprland: bind=$mod ALT, A/D, resizeactive, ±10 0
      - command: miraclemsg -c "resize left 10"
        action: down
        modifiers:
          - primary
          - alt
        key: a

      - command: miraclemsg -c "resize right 10"
        action: down
        modifiers:
          - primary
          - alt
        key: d

      # Hyprland: bind=$mod ALT, W/S, resizeactive, 0 ±10
      - command: miraclemsg -c "resize up 10"
        action: down
        modifiers:
          - primary
          - alt
        key: w

      - command: miraclemsg -c "resize down 10"
        action: down
        modifiers:
          - primary
          - alt
        key: s
  '';
}
