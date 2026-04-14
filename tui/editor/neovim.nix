{
  pkgs,
  pkgs-unstable,
  lib,
  ...
}:
let
  # lazy.nvim bootstrap snippet (standard)
  lazyBootstrap = ''
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
      local lazyrepo = "https://github.com/folke/lazy.nvim.git"
      local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
      if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({ { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" }, { "\nPress any key to continue..." } }, true, {})
        vim.fn.getchar()
        os.exit(1)
      end
    end
    vim.opt.rtp:prepend(lazypath)
  '';

  # Matugen theme loader — sourced from matugen-generated file
  matugenLoader = ''
    -- ── Matugen dynamic theme ────────────────────────────────────────────────
    local function load_matugen_theme()
      local path = vim.fn.expand("~/.config/nvim/matugen.lua")
      local f = io.open(path, "r")
      if f then
        io.close(f)
        dofile(path)
      else
        -- Fallback until matugen runs for the first time
        vim.cmd("colorscheme default")
        vim.notify("matugen theme not yet generated — run: matugen image <wallpaper>", vim.log.levels.WARN)
      end
    end

    -- Load on startup
    load_matugen_theme()

    -- Reload on SIGUSR1 (sent by matugen post_hook)
    vim.api.nvim_create_autocmd("Signal", {
      pattern = "SIGUSR1",
      callback = load_matugen_theme,
    })
  '';

  # Main init.lua content
  initLua = ''
    -- ── Options ──────────────────────────────────────────────────────────────
    vim.opt.number         = true
    vim.opt.relativenumber = true
    vim.opt.expandtab      = true
    vim.opt.shiftwidth     = 2
    vim.opt.tabstop        = 2
    vim.opt.smartindent    = true
    vim.opt.termguicolors  = true
    vim.opt.signcolumn     = "yes"
    vim.opt.updatetime     = 250
    vim.opt.timeoutlen     = 300
    vim.opt.splitright     = true
    vim.opt.splitbelow     = true
    vim.opt.undofile       = true
    vim.opt.ignorecase     = true
    vim.opt.smartcase      = true
    vim.opt.scrolloff      = 8
    vim.opt.cursorline     = true

    -- ── Leader ───────────────────────────────────────────────────────────────
    vim.g.mapleader      = " "
    vim.g.maplocalleader = "\\"

    -- ── Lazy bootstrap ───────────────────────────────────────────────────────
    ${lazyBootstrap}

    -- ── Plugins ──────────────────────────────────────────────────────────────
    require("lazy").setup({
      -- Base16 colorscheme (used by matugen template)
      {
        "RRethy/base16-nvim",
        lazy = false,
        priority = 1000,
      },

      -- LSP
      {
        "neovim/nvim-lspconfig",
        config = function()
          local lspconfig = require("lspconfig")
          -- Nix
          lspconfig.nixd.setup({})
          -- Python
          lspconfig.pyright.setup({})
        end,
      },

      -- Treesitter
      {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
          require("nvim-treesitter.configs").setup({
            ensure_installed = { "nix", "lua", "python", "typescript", "javascript", "rust", "go" },
            highlight = { enable = true },
            indent   = { enable = true },
          })
        end,
      },

      -- Fuzzy finder
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
          { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find Files" },
          { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live Grep"  },
          { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers"    },
          { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help Tags"  },
        },
      },

      -- File tree
      {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Tree" } },
        config = true,
      },

      -- Statusline
      {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
          require("lualine").setup({ options = { theme = "auto" } })
        end,
      },

      -- Git
      { "lewis6991/gitsigns.nvim", config = true },

      -- Auto-pairs
      { "windwp/nvim-autopairs",   config = true },

      -- Completion
      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "L3MON4D3/LuaSnip",
          "saadparwaiz1/cmp_luasnip",
        },
        config = function()
          local cmp    = require("cmp")
          local luasnip = require("luasnip")
          cmp.setup({
            snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
            mapping = cmp.mapping.preset.insert({
              ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
              ["<C-f>"]     = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<CR>"]      = cmp.mapping.confirm({ select = true }),
              ["<Tab>"]     = cmp.mapping(function(fallback)
                if cmp.visible() then cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
                else fallback() end
              end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
              { name = "nvim_lsp" },
              { name = "luasnip"  },
              { name = "buffer"   },
              { name = "path"     },
            }),
          })
        end,
      },

      -- Which-key hints
      { "folke/which-key.nvim", config = true },

      -- Chinese input method compatibility
      { "h-hg/fcitx.nvim" },
    }, {
      -- Use nix-provided lazy.nvim if network is unavailable
      performance = { rtp = { reset = false } },
    })

    -- ── Keymaps ──────────────────────────────────────────────────────────────
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
    end
    map("n", "<leader>w", "<cmd>w<cr>",         "Save")
    map("n", "<leader>q", "<cmd>q<cr>",         "Quit")
    map("n", "<leader>bd", "<cmd>bdelete<cr>",  "Delete Buffer")
    map("n", "<C-h>", "<C-w>h",                 "Move to left window")
    map("n", "<C-j>", "<C-w>j",                 "Move to lower window")
    map("n", "<C-k>", "<C-w>k",                 "Move to upper window")
    map("n", "<C-l>", "<C-w>l",                 "Move to right window")

    -- ── Matugen dynamic theme ────────────────────────────────────────────────
    ${matugenLoader}
  '';
in
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = false;   # EDITOR is set to vscodium in home.nix

    withNodeJs  = true;
    withPython3 = true;

    # LSP and tools available in nvim's PATH
    extraPackages = with pkgs; [
      nixd
      pyright
      lua-language-server
      stylua
      nixpkgs-fmt
    ];
  };

  # Write init.lua
  home.file.".config/nvim/init.lua".text = initLua;

  # matugen.lua is generated by matugen (nvim template) and loaded by init.lua.
  # We create a stub so nvim doesn't warn on first launch.
  home.file.".config/nvim/matugen.lua" = {
    force = false;   # don't overwrite matugen-generated file
    text = ''
      -- Placeholder until matugen generates this file.
      -- Run: matugen image <wallpaper-path>
      vim.cmd("colorscheme default")
    '';
  };
}
