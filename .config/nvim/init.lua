-- Preload
require("preload")

-- Load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin" },
  'navarasu/onedark.nvim',
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  "nvim-lualine/lualine.nvim",
  "rmagatti/auto-session",
  { "windwp/nvim-autopairs",   event = "InsertEnter" },
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  { 'akinsho/toggleterm.nvim', version = "*",        config = true },

  {
    "folke/zen-mode.nvim",
    -- lazy=false,
    opts = {
      window = {
        width = 130,
        options = {
          number = true,
        }
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false,   -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          laststatus = 0,  -- turn off the statusline in zen mode
        },
      }
    }
  },


  "neovim/nvim-lspconfig",
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },

    opts = function()
      return require "configs.mason"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "configs.luasnip"
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  "NMAC427/guess-indent.nvim",
  { "nvim-telescope/telescope.nvim",   tag = "0.1.2",                                     dependencies = { "nvim-lua/plenary.nvim" } },
  { "debugloop/telescope-undo.nvim",   dependencies = { "nvim-telescope/telescope.nvim" } },
  { "akinsho/toggleterm.nvim" },
  -- "klen/nvim-config-local",
  "rcarriga/nvim-notify",
  "mrded/nvim-lsp-notify",
  "lewis6991/gitsigns.nvim",


  { 'echasnovski/mini.nvim', version = '*' },
  { "folke/which-key.nvim" },

  -- formatting!
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { lua = { "stylua" } },
    },
  },



  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    config = function(_, opts)
      require("dapui").setup(opts)
    end,

  },

  -- LANGUAGE SPECIFICS
  --
  -- Java
  {
    "JavaHello/spring-boot.nvim",
    lazy = true,
    dependencies = {
      "nvim-java/nvim-java", -- or nvim-java, nvim-lspconfig
    },
    config = false
  },
  {
    "nvim-java/nvim-java",
    lazy = false,
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "nvim-java/nvim-java-refactor",
      {
        "mfussenegger/nvim-dap",
        dependencies = {
          { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
        },
      },
    },

    config = function()
      require("java").setup(require("configs.java"))
    end,
  },


  -- RUST
  -- install 'rust-src' package for autocompletion to work
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^5', -- Recommended
  --   lazy = false,   -- This plugin is already lazy
  -- },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      crates.show()
    end,
  },
})

-- Settings
require("general")

-- Plugins
require("auto-session").setup()
require("nvim-autopairs").setup()
require("line")
require("tree")
require("configs.lsp")
require("completion")
require("lint")
require("guess-indent").setup {}
require("telescope").setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}
require("term")
vim.notify = require("notify")

require('gitsigns').setup()
require("configs.toggleterm")

-- Settings (After plugin load)
require("mappings")
require("configs.whichkey")



