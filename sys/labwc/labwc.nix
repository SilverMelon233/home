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
        <keybind key="Super-Return"><action name="Execute"><command>ghostty</command></action></keybind>
        <keybind key="Super-b"><action name="Execute"><command>brave</command></action></keybind>
        <keybind key="Super-space"><action name="Execute"><command>dms ipc call spotlight toggle</command></action></keybind>

        <!-- ── Window management ─────────────────────────────────────────── -->
        <keybind key="Super-q"><action name="Close"/></keybind>
        <keybind key="Super-f"><action name="Maximize"/></keybind>
        <keybind key="Super-Shift-f"><action name="Fullscreen"/></keybind>
        <keybind key="Super-c"><action name="Center"/></keybind>
        <keybind key="Super-m"><action name="Exit"/></keybind>
        <keybind key="Super-l"><action name="Execute"><command>dms ipc lock lock</command></action></keybind>
        <keybind key="Super-Ctrl-s"><action name="Execute"><command>dms screenshot</command></action></keybind>

        <!-- ── Focus (ASWD) ──────────────────────────────────────────────── -->
        <keybind key="Super-a"><action name="NextWindow"><direction>left</direction></action></keybind>
        <keybind key="Super-d"><action name="NextWindow"><direction>right</direction></action></keybind>
        <keybind key="Super-w"><action name="NextWindow"><direction>up</direction></action></keybind>
        <keybind key="Super-s"><action name="NextWindow"><direction>down</direction></action></keybind>

        <!-- ── Move windows (SHIFT+ASWD) ─────────────────────────────────── -->
        <keybind key="Super-Shift-a"><action name="SnapToEdge"><direction>left</direction></action></keybind>
        <keybind key="Super-Shift-d"><action name="SnapToEdge"><direction>right</direction></action></keybind>
        <keybind key="Super-Shift-w"><action name="SnapToEdge"><direction>up</direction></action></keybind>
        <keybind key="Super-Shift-s"><action name="SnapToEdge"><direction>down</direction></action></keybind>

        <!-- ── Resize (ALT+ASWD) ─────────────────────────────────────────── -->
        <keybind key="Super-Alt-a"><action name="Resize"><left>-10</left></action></keybind>
        <keybind key="Super-Alt-d"><action name="Resize"><right>10</right></action></keybind>
        <keybind key="Super-Alt-w"><action name="Resize"><top>-10</top></action></keybind>
        <keybind key="Super-Alt-s"><action name="Resize"><bottom>10</bottom></action></keybind>

        <!-- ── Layout ────────────────────────────────────────────────────── -->
        <keybind key="Super-t"><action name="ToggleDecorations"/></keybind>
        <keybind key="Super-h"><action name="SnapToEdge"><direction>left</direction></action></keybind>
        <keybind key="Super-v"><action name="SnapToEdge"><direction>right</direction></action></keybind>

        <!-- ── Workspaces 1–10 ───────────────────────────────────────────── -->
        <keybind key="Super-1"><action name="GoToDesktop"><to>1</to></action></keybind>
        <keybind key="Super-2"><action name="GoToDesktop"><to>2</to></action></keybind>
        <keybind key="Super-3"><action name="GoToDesktop"><to>3</to></action></keybind>
        <keybind key="Super-4"><action name="GoToDesktop"><to>4</to></action></keybind>
        <keybind key="Super-5"><action name="GoToDesktop"><to>5</to></action></keybind>
        <keybind key="Super-6"><action name="GoToDesktop"><to>6</to></action></keybind>
        <keybind key="Super-7"><action name="GoToDesktop"><to>7</to></action></keybind>
        <keybind key="Super-8"><action name="GoToDesktop"><to>8</to></action></keybind>
        <keybind key="Super-9"><action name="GoToDesktop"><to>9</to></action></keybind>
        <keybind key="Super-0"><action name="GoToDesktop"><to>10</to></action></keybind>

        <keybind key="Super-Shift-1"><action name="SendToDesktop"><to>1</to></action></keybind>
        <keybind key="Super-Shift-2"><action name="SendToDesktop"><to>2</to></action></keybind>
        <keybind key="Super-Shift-3"><action name="SendToDesktop"><to>3</to></action></keybind>
        <keybind key="Super-Shift-4"><action name="SendToDesktop"><to>4</to></action></keybind>
        <keybind key="Super-Shift-5"><action name="SendToDesktop"><to>5</to></action></keybind>
        <keybind key="Super-Shift-6"><action name="SendToDesktop"><to>6</to></action></keybind>
        <keybind key="Super-Shift-7"><action name="SendToDesktop"><to>7</to></action></keybind>
        <keybind key="Super-Shift-8"><action name="SendToDesktop"><to>8</to></action></keybind>
        <keybind key="Super-Shift-9"><action name="SendToDesktop"><to>9</to></action></keybind>
        <keybind key="Super-Shift-0"><action name="SendToDesktop"><to>10</to></action></keybind>
      </keyboard>

      <mouse>
        <default />
        <context name="Root">
          <mousebind button="Button9" action="Click"><action name="GoToDesktop"><to>next</to></action></mousebind>
          <mousebind button="Button8" action="Click"><action name="GoToDesktop"><to>previous</to></action></mousebind>
        </context>
      </mouse>

      <touchpadGesture direction="left" fingers="3" action="swipe">
        <action name="GoToDesktop"><to>previous</to></action>
      </touchpadGesture>
      <touchpadGesture direction="right" fingers="3" action="swipe">
        <action name="GoToDesktop"><to>next</to></action>
      </touchpadGesture>
      <touchpadGesture direction="up" fingers="3" action="swipe">
        <action name="Fullscreen"/>
      </touchpadGesture>
      <touchpadGesture direction="down" fingers="3" action="swipe">
        <action name="Fullscreen"/>
      </touchpadGesture>

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
