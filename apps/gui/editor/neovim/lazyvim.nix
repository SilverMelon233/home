{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = false;

    withNodeJs = true;
    withPython3 = true;
    withRuby = false;

    extraPackages = with pkgs; [
      # LSP servers
      nixd
      lua-language-server
      pyright
      typescript-language-server
      rust-analyzer
      gopls
      # Formatters
      stylua
      nixpkgs-fmt
      black
      prettierd
      # Tools
      ripgrep
      fd
      lazygit
    ];
  };

  # LazyVim starter configuration
  # Clone from https://github.com/LazyVim/starter
  home.file.".config/nvim/.gitignore".text = ''
    tags
    tests/
    .cache/
    *.locale
    tt.*
    .tests/
   .luarc.json
  '';

  # Install script for LazyVim
  home.file.".local/bin/lazyvim-install".text = ''
    #!/bin/sh
    # Backup existing config
    if [ -d ~/.config/nvim ]; then
      mv ~/.config/nvim ~/.config/nvim.bak
    fi
    # Clone LazyVim starter
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    # Remove .git to allow user modifications
    rm -rf ~/.config/nvim/.git
    # Start nvim to install plugins
    nvim --headless "+Lazy! sync" +qa
  '';

  # LazyVim uses matugen theme via base16 plugin
  # Add matugen.lua for dynamic theme loading
  home.file.".config/nvim/lua/plugins/theme.lua".text = ''
    return {
      {
        "RRethy/base16-nvim",
        lazy = false,
        priority = 1000,
        config = function()
          -- Load matugen-generated theme
          local theme_path = vim.fn.expand("~/.config/nvim/matugen.lua")
          local f = io.open(theme_path, "r")
          if f then
            io.close(f)
            dofile(theme_path)
          else
            vim.cmd("colorscheme default")
          end
        end,
      },
    }
  '';
}