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

  # LazyVim installation helper script (optional, run manually)
  # User manages all LazyVim configs themselves
  home.file.".local/bin/lazyvim-setup".text = ''
    #!/bin/sh
    set -e
    
    echo "=== LazyVim Setup Helper ==="
    echo ""
    
    # Check if already installed
    if [ -d ~/.config/nvim ] && [ -f ~/.config/nvim/lazy-lock.json ]; then
      echo "LazyVim appears to be already installed."
      echo "Run 'nvim' to use it."
      exit 0
    fi
    
    # Backup existing config if exists
    if [ -d ~/.config/nvim ]; then
      echo "Backing up existing nvim config to ~/.config/nvim.bak"
      mv ~/.config/nvim ~/.config/nvim.bak
    fi
    
    # Clone LazyVim starter
    echo "Cloning LazyVim starter..."
    git clone https://github.com/LazyVim/starter ~/.config/nvim --depth 1
    rm -rf ~/.config/nvim/.git
    
    echo ""
    echo "LazyVim starter installed!"
    echo ""
    echo "To add matugen theme support, create ~/.config/nvim/lua/plugins/theme.lua:"
    echo ""
    echo '  return {'
    echo '    {'
    echo '      "RRethy/base16-nvim",'
    echo '      lazy = false,'
    echo '      priority = 1000,'
    echo '      config = function()'
    echo '        local f = io.open(vim.fn.expand("~/.config/nvim/matugen.lua"), "r")'
    echo '        if f then io.close(f); dofile(vim.fn.expand("~/.config/nvim/matugen.lua")) end'
    echo '      end,'
    echo '    },'
    echo '  }'
    echo ""
    echo "Then run: nvim"
    echo "Plugins will auto-install on first launch."
  '';
}