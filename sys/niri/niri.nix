{ pkgs, lib, ... }:
{
  # niri compositor — home-manager 25.11 does not have wayland.windowManager.niri,
  # so we manage the package and config file directly.
  home.packages = with pkgs; [
    niri
    xdg-desktop-portal-gnome  # portal support for niri
  ];

  # Main niri config — KDL format.
  # Matugen colors included at the bottom via activation script.
  home.file.".config/niri/config.kdl".text = ''
    // ── Input ──────────────────────────────────────────────────────────────
    input {
      keyboard {
        xkb { layout "us"; }
      }
      touchpad {
        tap
        natural-scroll
        dwt
      }
      warp-mouse-to-focus
      focus-follows-mouse
    }

    // ── Layout ─────────────────────────────────────────────────────────────
    layout {
      gaps 8

      preset-column-widths {
        proportion 0.33333
        proportion 0.5
        proportion 0.66667
      }

      default-column-width { proportion 0.5; }

      // Fallback colors overridden by matugen-colors.kdl include below
      focus-ring {
        width 2
        active-color "#7fc8ff"
        inactive-color "#505050"
      }

      border { off; }
    }

    // ── Animations ─────────────────────────────────────────────────────────
    animations { }

    // ── Startup ────────────────────────────────────────────────────────────
    spawn-at-startup "fcitx5"
    spawn-at-startup "dms" "run"

    // ── Environment ────────────────────────────────────────────────────────
    environment {
      DISPLAY ":0"
      QT_QPA_PLATFORMTHEME "qt6ct"
      QT_STYLE_OVERRIDE "kvantum"
    }

    // ── Keybindings ────────────────────────────────────────────────────────
    // All bindings mirror Hyprland equivalents as closely as niri allows.
    binds {
      // ── Applications ─────────────────────────────────────────────────────
      // Hyprland: bind=$mod, Return, exec, ghostty
      Mod+Return { spawn "ghostty"; }
      // Hyprland: bind=$mod, B, exec, brave
      Mod+B      { spawn "brave"; }
      // Hyprland: bind=$mod, Space, exec, dms ipc call spotlight toggle
      Mod+Space  { spawn "dms" "ipc" "call" "spotlight" "toggle"; }

      // ── Overview (hyprexpo equivalent) ───────────────────────────────────
      // Hyprland: bind=$mod, Tab, hyprexpo:expo, toggle
      Mod+Tab { toggle-overview; }

      // ── Window management ─────────────────────────────────────────────────
      // Hyprland: bind=$mod, Q, hy3:killactive
      Mod+Q { close-window; }

      // Hyprland: bind=$mod, F, fullscreen, 1  (maximize, not fullscreen)
      Mod+F { maximize-column; }
      // Hyprland: bind=$mod SHIFT, F, fullscreen  (true fullscreen)
      Mod+Shift+F { fullscreen-window; }

      // Hyprland: bind=$mod, C, hy3:changegroup, opposite  → center column
      Mod+C { center-column; }

      // Hyprland: bind=$mod, T, hy3:changegroup, toggletab
      // niri equivalent: toggle tabbed display for the focused column
      Mod+T { toggle-column-tabbed-display; }

      // Hyprland: bind=$mod, H, hy3:makegroup, h  → consume window into column (vertical stack)
      Mod+H { consume-window-into-column; }
      // Hyprland: bind=$mod, V, hy3:makegroup, v  → expel window from column (split out)
      Mod+V { expel-window-from-column; }

      // ── Focus (ASWD — identical to Hyprland) ─────────────────────────────
      // Hyprland: bind=$mod, A/D/W/S, hy3:movefocus, l/r/u/d
      Mod+A { focus-column-left; }
      Mod+D { focus-column-right; }
      Mod+W { focus-window-up-or-focus-workspace-up; }
      Mod+S { focus-window-down-or-focus-workspace-down; }

      // ── Move windows (SHIFT+ASWD) ─────────────────────────────────────────
      // Hyprland: bind=$mod SHIFT, A/D/W/S, hy3:movewindow, l/r/u/d
      Mod+Shift+A { move-column-left; }
      Mod+Shift+D { move-column-right; }
      Mod+Shift+W { move-window-up-or-move-to-workspace-up; }
      Mod+Shift+S { move-window-down-or-move-to-workspace-down; }

      // ── Resize (ALT+ASWD) ────────────────────────────────────────────────
      // Hyprland: bind=$mod ALT, A/D/W/S, resizeactive, ±10
      Mod+Alt+A { set-column-width "-10%"; }
      Mod+Alt+D { set-column-width "+10%"; }
      Mod+Alt+W { set-window-height "-10%"; }
      Mod+Alt+S { set-window-height "+10%"; }

      // ── Tab navigation within column ──────────────────────────────────────
      // Hyprland: bind=$mod, comma/period, hy3:focustab, l/r, wrap
      Mod+comma  { focus-window-previous; }
      Mod+period { focus-column-next; }

      // ── Preset column widths (niri extra) ────────────────────────────────
      Mod+R { switch-preset-column-width; }

      // ── Workspaces 1–9 ───────────────────────────────────────────────────
      // Hyprland: bind=$mod, 1-9, workspace, 1-9
      Mod+1 { focus-workspace 1; }
      Mod+2 { focus-workspace 2; }
      Mod+3 { focus-workspace 3; }
      Mod+4 { focus-workspace 4; }
      Mod+5 { focus-workspace 5; }
      Mod+6 { focus-workspace 6; }
      Mod+7 { focus-workspace 7; }
      Mod+8 { focus-workspace 8; }
      Mod+9 { focus-workspace 9; }
      // Hyprland: bind=$mod, 0, workspace, 10
      Mod+0 { focus-workspace 10; }

      // Hyprland: bind=$mod SHIFT, 1-9, hy3:movetoworkspace, 1-9
      Mod+Shift+1 { move-column-to-workspace 1; }
      Mod+Shift+2 { move-column-to-workspace 2; }
      Mod+Shift+3 { move-column-to-workspace 3; }
      Mod+Shift+4 { move-column-to-workspace 4; }
      Mod+Shift+5 { move-column-to-workspace 5; }
      Mod+Shift+6 { move-column-to-workspace 6; }
      Mod+Shift+7 { move-column-to-workspace 7; }
      Mod+Shift+8 { move-column-to-workspace 8; }
      Mod+Shift+9 { move-column-to-workspace 9; }
      // Hyprland: bind=$mod SHIFT, 0, hy3:movetoworkspace, 10
      Mod+Shift+0 { move-column-to-workspace 10; }

      // Hyprland: bind=, mouse:275/276, workspace, e+1/e-1
      // niri: scroll through workspaces with mouse side buttons
      Mod+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }
      Mod+WheelScrollUp   cooldown-ms=150 { focus-workspace-up; }

      // ── Screenshot & session ──────────────────────────────────────────────
      // Hyprland: bind=$mod CTRL, S, exec, dms screenshot
      Mod+Ctrl+S { spawn "dms" "screenshot"; }
      // Hyprland: bind=$mod, M, exec, hyprshutdown || hyprctl dispatch exit
      Mod+M { spawn "sh" "-c" "niri msg action quit"; }
      // Hyprland: bind=$mod, L, exec, dms ipc lock lock
      Mod+L { spawn "dms" "ipc" "lock" "lock"; }
    }

    // ── Matugen dynamic colors ──────────────────────────────────────────────
    // Generated by: matugen image <wallpaper>
    // File: ~/.config/niri/matugen-colors.kdl
    include "matugen-colors.kdl"
  '';
}
