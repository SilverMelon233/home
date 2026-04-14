{ pkgs, ... }:
{
  home.packages = with pkgs; [
    miracle-wm
    xdg-desktop-portal-wlr
    zenity
  ];

  home.file.".config/miracle-wm/config.yaml".text = ''
    action_key: meta

    input:
      keyboard:
        xkb_layout: us
      touchpad:
        tap: true
        natural_scroll: true
        disable_while_typing: true

    inner_gaps: 8
    outer_gaps: 8
    border:
      size: 2

    terminal: ghostty
    resize_jump: 10

    environment:
      QT_QPA_PLATFORMTHEME: qt6ct
      QT_STYLE_OVERRIDE: kvantum
      NIXOS_OZONE_WL: "1"

    startup_apps:
      - command: fcitx5
      - command: dms run

    includes:
      - ~/.config/miracle-wm/matugen-colors.yaml

    default_action_overrides:
      - name: terminal
        action: down
        modifiers:
          - primary
        key: KEY_ENTER

      - name: quit_active_window
        action: down
        modifiers:
          - primary
        key: KEY_Q

      - name: fullscreen
        action: down
        modifiers:
          - primary
        key: KEY_F

      - name: request_horizontal
        action: down
        modifiers:
          - primary
        key: KEY_H

      - name: request_vertical
        action: down
        modifiers:
          - primary
        key: KEY_V

      - name: select_left
        action: down
        modifiers:
          - primary
        key: KEY_A

      - name: select_right
        action: down
        modifiers:
          - primary
        key: KEY_D

      - name: select_up
        action: down
        modifiers:
          - primary
        key: KEY_W

      - name: select_down
        action: down
        modifiers:
          - primary
        key: KEY_S

      - name: move_left
        action: down
        modifiers:
          - primary
          - shift
        key: KEY_A

      - name: move_right
        action: down
        modifiers:
          - primary
          - shift
        key: KEY_D

      - name: move_up
        action: down
        modifiers:
          - primary
          - shift
        key: KEY_W

      - name: move_down
        action: down
        modifiers:
          - primary
          - shift
        key: KEY_S

      - name: select_workspace_1
        action: down
        modifiers:
          - primary
        key: KEY_1

      - name: select_workspace_2
        action: down
        modifiers:
          - primary
        key: KEY_2

      - name: select_workspace_3
        action: down
        modifiers:
          - primary
        key: KEY_3

      - name: select_workspace_4
        action: down
        modifiers:
          - primary
        key: KEY_4

      - name: select_workspace_5
        action: down
        modifiers:
          - primary
        key: KEY_5

      - name: select_workspace_6
        action: down
        modifiers:
          - primary
        key: KEY_6

      - name: select_workspace_7
        action: down
        modifiers:
          - primary
        key: KEY_7

      - name: select_workspace_8
        action: down
        modifiers:
          - primary
        key: KEY_8

      - name: select_workspace_9
        action: down
        modifiers:
          - primary
        key: KEY_9

      - name: select_workspace_0
        action: down
        modifiers:
          - primary
        key: KEY_0

    custom_actions:
      - command: brave
        action: down
        modifiers:
          - primary
        key: KEY_B

      - command: dms ipc call spotlight toggle
        action: down
        modifiers:
          - primary
        key: KEY_SPACE

      - command: miraclemsg -c "fullscreen"
        action: down
        modifiers:
          - primary
          - shift
        key: KEY_F

      - command: miraclemsg -c "move_to_center"
        action: down
        modifiers:
          - primary
        key: KEY_C

      - command: zenity --question --text='Exit miracle?' --title='Confirm' && miraclemsg -c "quit"
        action: down
        modifiers:
          - primary
        key: KEY_M

      - command: dms ipc lock lock
        action: down
        modifiers:
          - primary
        key: KEY_L

      - command: dms screenshot
        action: down
        modifiers:
          - primary
          - ctrl
        key: KEY_S

      - command: miraclemsg -c "resize left 10"
        action: down
        modifiers:
          - primary
          - alt
        key: KEY_A

      - command: miraclemsg -c "resize right 10"
        action: down
        modifiers:
          - primary
          - alt
        key: KEY_D

      - command: miraclemsg -c "resize up 10"
        action: down
        modifiers:
          - primary
          - alt
        key: KEY_W

      - command: miraclemsg -c "resize down 10"
        action: down
        modifiers:
          - primary
          - alt
        key: KEY_S
  '';
}
