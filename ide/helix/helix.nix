{
  pkgs,
  userConfig,
  ...
}:
let
  style = userConfig.catppuccinStyle;

  catppuccinPalettes = {
    latte = {
      rosewater = "#dc8a78";
      flamingo = "#dd7878";
      pink = "#ea76cb";
      mauve = "#8839ef";
      red = "#d20f39";
      maroon = "#e64553";
      peach = "#fe640b";
      yellow = "#df8e1d";
      green = "#40a02b";
      teal = "#179299";
      sky = "#04a5e5";
      sapphire = "#209fb5";
      blue = "#1e66f5";
      lavender = "#7287fd";
      text = "#4c4f69";
      subtext1 = "#5c5f77";
      subtext0 = "#6c6f85";
      overlay2 = "#7c7f93";
      overlay1 = "#8c8fa1";
      overlay0 = "#9ca0b0";
      surface2 = "#acb0be";
      surface1 = "#bcc0cc";
      surface0 = "#ccd0da";
      base = "#eff1f5";
      mantle = "#e6e9ef";
      crust = "#dce0e8";
      cursorline = "#e8ecf1";
      secondary_cursor = "#e1a99d";
      secondary_cursor_select = "#97a7fb";
      secondary_cursor_normal = "#e1a99d";
      secondary_cursor_insert = "#74b867";
    };
    frappe = {
      rosewater = "#f2d5cf";
      flamingo = "#eebebe";
      pink = "#f4b8e4";
      mauve = "#ca9ee6";
      red = "#e78284";
      maroon = "#ea999c";
      peach = "#ef9f76";
      yellow = "#e5c890";
      green = "#a6d189";
      teal = "#81c8be";
      sky = "#99d1db";
      sapphire = "#85c1dc";
      blue = "#8caaee";
      lavender = "#babbf1";
      text = "#c6d0f5";
      subtext1 = "#b5bfe2";
      subtext0 = "#a5adce";
      overlay2 = "#949cbb";
      overlay1 = "#838ba7";
      overlay0 = "#737994";
      surface2 = "#626880";
      surface1 = "#51576d";
      surface0 = "#414559";
      base = "#303446";
      mantle = "#292c3c";
      crust = "#232634";
      cursorline = "#3b3f52";
      secondary_cursor = "#b8a5a6";
      secondary_cursor_select = "#9192be";
      secondary_cursor_normal = "#b8a5a6";
      secondary_cursor_insert = "#83a275";
    };
    macchiato = {
      rosewater = "#f4dbd6";
      flamingo = "#f0c6c6";
      pink = "#f5bde6";
      mauve = "#c6a0f6";
      red = "#ed8796";
      maroon = "#ee99a0";
      peach = "#f5a97f";
      yellow = "#eed49f";
      green = "#a6da95";
      teal = "#8bd5ca";
      sky = "#91d7e3";
      sapphire = "#7dc4e4";
      blue = "#8aadf4";
      lavender = "#b7bdf8";
      text = "#cad3f5";
      subtext1 = "#b8c0e0";
      subtext0 = "#a5adcb";
      overlay2 = "#939ab7";
      overlay1 = "#8087a2";
      overlay0 = "#6e738d";
      surface2 = "#5b6078";
      surface1 = "#494d64";
      surface0 = "#363a4f";
      base = "#24273a";
      mantle = "#1e2030";
      crust = "#181926";
      cursorline = "#303347";
      secondary_cursor = "#b6a6a7";
      secondary_cursor_select = "#8b91bf";
      secondary_cursor_normal = "#b6a6a7";
      secondary_cursor_insert = "#80a57a";
    };
    mocha = {
      rosewater = "#f5e0dc";
      flamingo = "#f2cdcd";
      pink = "#f5c2e7";
      mauve = "#cba6f7";
      red = "#f38ba8";
      maroon = "#eba0ac";
      peach = "#fab387";
      yellow = "#f9e2af";
      green = "#a6e3a1";
      teal = "#94e2d5";
      sky = "#89dceb";
      sapphire = "#74c7ec";
      blue = "#89b4fa";
      lavender = "#b4befe";
      text = "#cdd6f4";
      subtext1 = "#bac2de";
      subtext0 = "#a6adc8";
      overlay2 = "#9399b2";
      overlay1 = "#7f849c";
      overlay0 = "#6c7086";
      surface2 = "#585b70";
      surface1 = "#45475a";
      surface0 = "#313244";
      base = "#1e1e2e";
      mantle = "#181825";
      crust = "#11111b";
      cursorline = "#2a2b3c";
      secondary_cursor = "#b5a6a8";
      secondary_cursor_select = "#878ec0";
      secondary_cursor_normal = "#b5a6a8";
      secondary_cursor_insert = "#7ea87f";
    };
  };

  catppuccinTheme = {
    attribute = "yellow";
    type = "yellow";
    "type.builtin" = "mauve";
    "type.enum.variant" = "teal";
    constructor = "sapphire";
    constant = "peach";
    "constant.character" = "teal";
    "constant.character.escape" = "pink";
    string = "green";
    "string.regexp" = "pink";
    "string.special" = "blue";
    "string.special.symbol" = "red";
    comment = {
      fg = "overlay2";
      modifiers = [ "italic" ];
    };
    variable = "text";
    "variable.parameter" = {
      fg = "maroon";
      modifiers = [ "italic" ];
    };
    "variable.builtin" = "red";
    "variable.other.member" = "blue";
    label = "sapphire";
    punctuation = "overlay2";
    "punctuation.special" = "sky";
    keyword = "mauve";
    "keyword.control.conditional" = {
      fg = "mauve";
      modifiers = [ "italic" ];
    };
    operator = "sky";
    function = "blue";
    "function.macro" = "rosewater";
    tag = "blue";
    namespace = {
      fg = "yellow";
      modifiers = [ "italic" ];
    };
    special = "blue";
    "markup.heading.1" = "red";
    "markup.heading.2" = "peach";
    "markup.heading.3" = "yellow";
    "markup.heading.4" = "green";
    "markup.heading.5" = "sapphire";
    "markup.heading.6" = "lavender";
    "markup.list" = "teal";
    "markup.list.unchecked" = "overlay2";
    "markup.list.checked" = "green";
    "markup.bold" = {
      fg = "red";
      modifiers = [ "bold" ];
    };
    "markup.italic" = {
      fg = "red";
      modifiers = [ "italic" ];
    };
    "markup.link.url" = {
      fg = "blue";
      modifiers = [
        "italic"
        "underlined"
      ];
    };
    "markup.link.text" = "lavender";
    "markup.link.label" = "sapphire";
    "markup.raw" = "green";
    "markup.quote" = "pink";
    "diff.plus" = "green";
    "diff.minus" = "red";
    "diff.delta" = "blue";
    "ui.background" = {
      fg = "text";
      bg = "base";
    };
    "ui.linenr" = {
      fg = "surface1";
    };
    "ui.linenr.selected" = {
      fg = "lavender";
    };
    "ui.statusline" = {
      fg = "subtext1";
      bg = "mantle";
    };
    "ui.statusline.inactive" = {
      fg = "surface2";
      bg = "mantle";
    };
    "ui.statusline.normal" = {
      fg = "base";
      bg = "rosewater";
      modifiers = [ "bold" ];
    };
    "ui.statusline.insert" = {
      fg = "base";
      bg = "green";
      modifiers = [ "bold" ];
    };
    "ui.statusline.select" = {
      fg = "base";
      bg = "lavender";
      modifiers = [ "bold" ];
    };
    "ui.popup" = {
      fg = "text";
      bg = "surface0";
    };
    "ui.window" = {
      fg = "crust";
    };
    "ui.help" = {
      fg = "overlay2";
      bg = "surface0";
    };
    "ui.bufferline" = {
      fg = "subtext0";
      bg = "mantle";
    };
    "ui.bufferline.active" = {
      fg = "mauve";
      bg = "base";
      underline = {
        color = "mauve";
        style = "line";
      };
    };
    "ui.bufferline.background" = {
      bg = "crust";
    };
    "ui.text" = "text";
    "ui.text.focus" = {
      fg = "text";
      bg = "surface0";
      modifiers = [ "bold" ];
    };
    "ui.text.inactive" = {
      fg = "overlay1";
    };
    "ui.text.directory" = {
      fg = "blue";
    };
    "ui.virtual" = "overlay0";
    "ui.virtual.ruler" = {
      bg = "surface0";
    };
    "ui.virtual.indent-guide" = "surface0";
    "ui.virtual.inlay-hint" = {
      fg = "surface1";
      bg = "mantle";
    };
    "ui.virtual.jump-label" = {
      fg = "rosewater";
      modifiers = [ "bold" ];
    };
    "ui.selection" = {
      bg = "surface1";
    };
    "ui.cursor" = {
      fg = "base";
      bg = "secondary_cursor";
    };
    "ui.cursor.primary" = {
      fg = "base";
      bg = "rosewater";
    };
    "ui.cursor.match" = {
      fg = "peach";
      modifiers = [ "bold" ];
    };
    "ui.cursor.primary.normal" = {
      fg = "base";
      bg = "rosewater";
    };
    "ui.cursor.primary.insert" = {
      fg = "base";
      bg = "green";
    };
    "ui.cursor.primary.select" = {
      fg = "base";
      bg = "lavender";
    };
    "ui.cursor.normal" = {
      fg = "base";
      bg = "secondary_cursor_normal";
    };
    "ui.cursor.insert" = {
      fg = "base";
      bg = "secondary_cursor_insert";
    };
    "ui.cursor.select" = {
      fg = "base";
      bg = "secondary_cursor_select";
    };
    "ui.cursorline.primary" = {
      bg = "cursorline";
    };
    "ui.highlight" = {
      bg = "surface1";
      modifiers = [ "bold" ];
    };
    "ui.menu" = {
      fg = "overlay2";
      bg = "surface0";
    };
    "ui.menu.selected" = {
      fg = "text";
      bg = "surface1";
      modifiers = [ "bold" ];
    };
    "diagnostic.error" = {
      underline = {
        color = "red";
        style = "curl";
      };
    };
    "diagnostic.warning" = {
      underline = {
        color = "yellow";
        style = "curl";
      };
    };
    "diagnostic.info" = {
      underline = {
        color = "sky";
        style = "curl";
      };
    };
    "diagnostic.hint" = {
      underline = {
        color = "teal";
        style = "curl";
      };
    };
    "diagnostic.unnecessary" = {
      modifiers = [ "dim" ];
    };
    "diagnostic.deprecated" = {
      modifiers = [ "crossed_out" ];
    };
    error = "red";
    warning = "yellow";
    info = "sky";
    hint = "teal";
    rainbow = [
      "red"
      "peach"
      "yellow"
      "green"
      "sapphire"
      "lavender"
    ];
  };

  catppuccinThemes = {
    catppuccin-latte = catppuccinTheme // {
      palette = catppuccinPalettes.latte;
    };
    catppuccin-frappe = catppuccinTheme // {
      palette = catppuccinPalettes.frappe;
    };
    catppuccin-macchiato = catppuccinTheme // {
      palette = catppuccinPalettes.macchiato;
    };
    catppuccin-mocha = catppuccinTheme // {
      palette = catppuccinPalettes.mocha;
    };
  };
in
{
  programs.helix = {
    enable = true;
    themes = catppuccinThemes;
    settings = {
      theme = "catppuccin-${style}";
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        auto-save = true;
        auto-completion = true;
        completion-trigger-len = 1;
        editor-config = false;
        indent-guides.render = true;
        smart-tab = {
          enable = true;
        };
        trim-trailing-whitespace = true;
        auto-pairs = true;
        insert-final-newline = true;
        cursorline = true;
        color-modes = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        soft-wrap = {
          enable = true;
          max-wrap = 25;
        };
        scroll-lines = 1;
        mouse = true;
        middle-click-paste = true;
      };
    };
    languages.language = [
      {
        name = "nix";
        formatter = {
          command = "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt";
        };
      }
    ];
  };
}
