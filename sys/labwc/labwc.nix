{ pkgs, ... }:
{
  home.packages = with pkgs; [
    labwc
    xdg-desktop-portal-wlr
  ];

  home.file.".config/labwc/rc.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <openbox_config xmlns="http://openbox.org/3.4/rc">
      <core>
        <decoration>server</decoration>
      </core>

      <theme>
        <cornerRadius>8</cornerRadius>
        <gap>8</gap>
      </theme>

      <keyboard>
        <!-- ── Applications ─────────────────────────────────────────────── -->
        <!-- Hyprland: bind=$mod, Return, exec, ghostty -->
        <keybind key="Super-Return"><action name="Execute"><command>ghostty</command></action></keybind>
        <!-- Hyprland: bind=$mod, B, exec, brave -->
        <keybind key="Super-B"><action name="Execute"><command>brave</command></action></keybind>
        <!-- Hyprland: bind=$mod, Space, exec, dms ipc call spotlight toggle -->
        <keybind key="Super-space"><action name="Execute"><command>dms ipc call spotlight toggle</command></action></keybind>

        <!-- ── Window management ─────────────────────────────────────────── -->
        <!-- Hyprland: bind=$mod, Q, killactive -->
        <keybind key="Super-Q"><action name="Close"/></keybind>
        <!-- Hyprland: bind=$mod, F, fullscreen, 1 (maximize) -->
        <keybind key="Super-F"><action name="Maximize"/></keybind>
        <!-- Hyprland: bind=$mod SHIFT, F, fullscreen (true fullscreen) -->
        <keybind key="Super-Shift-F"><action name="Fullscreen"/></keybind>
        <!-- Hyprland: bind=$mod, C, centerwindow -->
        <keybind key="Super-C"><action name="Center"/></keybind>
        <!-- Hyprland: bind=$mod, M, exit -->
        <keybind key="Super-M"><action name="Exit"/></keybind>
        <!-- Hyprland: bind=$mod, L, exec, dms ipc lock lock -->
        <keybind key="Super-L"><action name="Execute"><command>dms ipc lock lock</command></action></keybind>
        <!-- Hyprland: bind=$mod CTRL, S, exec, dms screenshot -->
        <keybind key="Super-Ctrl-S"><action name="Execute"><command>dms screenshot</command></action></keybind>

        <!-- ── Focus (ASWD) ──────────────────────────────────────────────── -->
        <!-- Hyprland: bind=$mod, A/D/W/S, movefocus, l/r/u/d -->
        <keybind key="Super-A"><action name="MoveToEdge"><direction>left</direction></action></keybind>
        <keybind key="Super-D"><action name="MoveToEdge"><direction>right</direction></action></keybind>
        <keybind key="Super-W"><action name="MoveToEdge"><direction>up</direction></action></keybind>
        <keybind key="Super-S"><action name="MoveToEdge"><direction>down</direction></action></keybind>

        <!-- ── Move windows (SHIFT+ASWD) ─────────────────────────────────── -->
        <!-- Hyprland: bind=$mod SHIFT, A/D/W/S, movewindow, l/r/u/d -->
        <keybind key="Super-Shift-A"><action name="SnapToEdge"><direction>left</direction></action></keybind>
        <keybind key="Super-Shift-D"><action name="SnapToEdge"><direction>right</direction></action></keybind>
        <keybind key="Super-Shift-W"><action name="SnapToEdge"><direction>up</direction></action></keybind>
        <keybind key="Super-Shift-S"><action name="SnapToEdge"><direction>down</direction></action></keybind>

        <!-- ── Resize (ALT+ASWD) ─────────────────────────────────────────── -->
        <!-- Hyprland: bind=$mod ALT, A/D/W/S, resizeactive, ±10 -->
        <keybind key="Super-Alt-A"><action name="Resize"><left>-10</left></action></keybind>
        <keybind key="Super-Alt-D"><action name="Resize"><right>10</right></action></keybind>
        <keybind key="Super-Alt-W"><action name="Resize"><top>-10</top></action></keybind>
        <keybind key="Super-Alt-S"><action name="Resize"><bottom>10</bottom></action></keybind>

        <!-- ── Layout ────────────────────────────────────────────────────── -->
        <!-- Hyprland: bind=$mod, T, togglegroup -->
        <keybind key="Super-T"><action name="ToggleDecorations"/></keybind>

        <!-- ── Workspaces 1–10 ───────────────────────────────────────────── -->
        <!-- Hyprland: bind=$mod, 1-9, workspace, 1-9 -->
        <keybind key="Super-1"><action name="GoToDesktop"><to>1</to></action></keybind>
        <keybind key="Super-2"><action name="GoToDesktop"><to>2</to></action></keybind>
        <keybind key="Super-3"><action name="GoToDesktop"><to>3</to></action></keybind>
        <keybind key="Super-4"><action name="GoToDesktop"><to>4</to></action></keybind>
        <keybind key="Super-5"><action name="GoToDesktop"><to>5</to></action></keybind>
        <keybind key="Super-6"><action name="GoToDesktop"><to>6</to></action></keybind>
        <keybind key="Super-7"><action name="GoToDesktop"><to>7</to></action></keybind>
        <keybind key="Super-8"><action name="GoToDesktop"><to>8</to></action></keybind>
        <keybind key="Super-9"><action name="GoToDesktop"><to>9</to></action></keybind>
        <!-- Hyprland: bind=$mod, 0, workspace, 10 -->
        <keybind key="Super-0"><action name="GoToDesktop"><to>10</to></action></keybind>

        <!-- Hyprland: bind=$mod SHIFT, 1-9, movetoworkspace, 1-9 -->
        <keybind key="Super-Shift-1"><action name="SendToDesktop"><to>1</to></action></keybind>
        <keybind key="Super-Shift-2"><action name="SendToDesktop"><to>2</to></action></keybind>
        <keybind key="Super-Shift-3"><action name="SendToDesktop"><to>3</to></action></keybind>
        <keybind key="Super-Shift-4"><action name="SendToDesktop"><to>4</to></action></keybind>
        <keybind key="Super-Shift-5"><action name="SendToDesktop"><to>5</to></action></keybind>
        <keybind key="Super-Shift-6"><action name="SendToDesktop"><to>6</to></action></keybind>
        <keybind key="Super-Shift-7"><action name="SendToDesktop"><to>7</to></action></keybind>
        <keybind key="Super-Shift-8"><action name="SendToDesktop"><to>8</to></action></keybind>
        <keybind key="Super-Shift-9"><action name="SendToDesktop"><to>9</to></action></keybind>
        <!-- Hyprland: bind=$mod SHIFT, 0, movetoworkspace, 10 -->
        <keybind key="Super-Shift-0"><action name="SendToDesktop"><to>10</to></action></keybind>
      </keyboard>

      <mouse>
        <default />
        <!-- Hyprland: bind=, mouse:275/276, workspace, e+1/e-1 -->
        <context name="Root">
          <mousebind button="Button9" action="Click"><action name="GoToDesktop"><to>next</to></action></mousebind>
          <mousebind button="Button8" action="Click"><action name="GoToDesktop"><to>previous</to></action></mousebind>
        </context>
      </mouse>

      <desktops number="10" />

      <libinput>
        <device category="touchpad">
          <naturalScroll>true</naturalScroll>
          <tap>yes</tap>
          <disableWhileTyping>yes</disableWhileTyping>
        </device>
      </libinput>

      <environment>
        <name>QT_QPA_PLATFORMTHEME</name><value>qt6ct</value>
        <name>QT_STYLE_OVERRIDE</name><value>kvantum</value>
      </environment>

      <startup>
        <command>fcitx5</command>
        <command>dms run</command>
      </startup>
    </openbox_config>
  '';
}
