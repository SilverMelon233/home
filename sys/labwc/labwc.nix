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

      <desktops number="10" />

      <!-- Default scale for eDP-1 -->
      <output name="eDP-1" scale="1.75" />

      <keyboard>
        <default />
        <!-- ── Applications ─────────────────────────────────────────────── -->
        <keybind key="W-Return"><action name="Execute"><command>ghostty</command></action></keybind>
        <keybind key="W-b"><action name="Execute"><command>brave</command></action></keybind>
        <keybind key="W-space"><action name="Execute"><command>dms ipc call spotlight toggle</command></action></keybind>

        <!-- ── Window management ─────────────────────────────────────────── -->
        <keybind key="W-q"><action name="Close"/></keybind>
        <keybind key="W-f"><action name="Maximize"/></keybind>
        <keybind key="W-S-f"><action name="Fullscreen"/></keybind>
        <keybind key="W-c"><action name="Center"/></keybind>
        <keybind key="W-m"><action name="Execute"><command>labnag -t warning -m 'Exit labwc?' -Z 'Yes' 'labwc -e'</command></action></keybind>
        <keybind key="W-l"><action name="Execute"><command>dms ipc lock lock</command></action></keybind>
        <keybind key="W-C-s"><action name="Execute"><command>dms screenshot</command></action></keybind>

        <!-- ── Focus (ASWD) ──────────────────────────────────────────────── -->
        <keybind key="W-a"><action name="NextWindow"><direction>left</direction></action></keybind>
        <keybind key="W-d"><action name="NextWindow"><direction>right</direction></action></keybind>
        <keybind key="W-w"><action name="NextWindow"><direction>up</direction></action></keybind>
        <keybind key="W-s"><action name="NextWindow"><direction>down</direction></action></keybind>

        <!-- ── Move windows (SHIFT+ASWD) ─────────────────────────────────── -->
        <keybind key="W-S-a"><action name="SnapToEdge"><direction>left</direction></action></keybind>
        <keybind key="W-S-d"><action name="SnapToEdge"><direction>right</direction></action></keybind>
        <keybind key="W-S-w"><action name="SnapToEdge"><direction>up</direction></action></keybind>
        <keybind key="W-S-s"><action name="SnapToEdge"><direction>down</direction></action></keybind>

        <!-- ── Resize (ALT+ASWD) ─────────────────────────────────────────── -->
        <keybind key="W-A-a"><action name="Resize"><left>-10</left></action></keybind>
        <keybind key="W-A-d"><action name="Resize"><right>10</right></action></keybind>
        <keybind key="W-A-w"><action name="Resize"><top>-10</top></action></keybind>
        <keybind key="W-A-s"><action name="Resize"><bottom>10</bottom></action></keybind>

        <!-- ── Layout ────────────────────────────────────────────────────── -->
        <keybind key="W-t"><action name="ToggleDecorations"/></keybind>
        <keybind key="W-h"><action name="SnapToEdge"><direction>left</direction></action></keybind>
        <keybind key="W-v"><action name="SnapToEdge"><direction>right</direction></action></keybind>

        <!-- ── Workspaces 1–10 ───────────────────────────────────────────── -->
        <keybind key="W-1"><action name="GoToDesktop"><to>1</to></action></keybind>
        <keybind key="W-2"><action name="GoToDesktop"><to>2</to></action></keybind>
        <keybind key="W-3"><action name="GoToDesktop"><to>3</to></action></keybind>
        <keybind key="W-4"><action name="GoToDesktop"><to>4</to></action></keybind>
        <keybind key="W-5"><action name="GoToDesktop"><to>5</to></action></keybind>
        <keybind key="W-6"><action name="GoToDesktop"><to>6</to></action></keybind>
        <keybind key="W-7"><action name="GoToDesktop"><to>7</to></action></keybind>
        <keybind key="W-8"><action name="GoToDesktop"><to>8</to></action></keybind>
        <keybind key="W-9"><action name="GoToDesktop"><to>9</to></action></keybind>
        <keybind key="W-0"><action name="GoToDesktop"><to>10</to></action></keybind>

        <keybind key="W-S-1"><action name="SendToDesktop"><to>1</to></action></keybind>
        <keybind key="W-S-2"><action name="SendToDesktop"><to>2</to></action></keybind>
        <keybind key="W-S-3"><action name="SendToDesktop"><to>3</to></action></keybind>
        <keybind key="W-S-4"><action name="SendToDesktop"><to>4</to></action></keybind>
        <keybind key="W-S-5"><action name="SendToDesktop"><to>5</to></action></keybind>
        <keybind key="W-S-6"><action name="SendToDesktop"><to>6</to></action></keybind>
        <keybind key="W-S-7"><action name="SendToDesktop"><to>7</to></action></keybind>
        <keybind key="W-S-8"><action name="SendToDesktop"><to>8</to></action></keybind>
        <keybind key="W-S-9"><action name="SendToDesktop"><to>9</to></action></keybind>
        <keybind key="W-S-0"><action name="SendToDesktop"><to>10</to></action></keybind>
      </keyboard>

      <mouse>
        <default />
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
