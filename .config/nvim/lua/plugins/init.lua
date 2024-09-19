return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "java",
        "rust",
      },
    },
  },

  {
    "folke/zen-mode.nvim",
    -- lazy=false,
  },

  -- LANGUAGE SPECIFICS
  --
  -- Java
  {
    "nvim-java/nvim-java",
    lazy = false,
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      {
        "mfussenegger/nvim-dap",
        dependencies = {
          { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
        },
      },
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {
              settings = {
                java = {
                  configuration = {
                    runtimes = {
                      {
                        name = "javase-19",
                        path = "~/.jdk/jdk-19.0.2",
                      },
                      {
                        name = "javase-21",
                        path = "~/.jdk/jdk-21",
                      },
                    },
                  },
                },
              },
            },
          },
          setup = {
            jdtls = function()
              require("java").setup {
                root_markers = {
                  "settings.gradle",
                  "settings.gradle.kts",
                  "pom.xml",
                  "build.gradle",
                  "mvnw",
                  "gradlew",
                  "build.gradle",
                  "build.gradle.kts",
                },
              }
            end,
          },
        },
      },
    },
    config = function()
      require("java").setup {}
      require("lspconfig").jdtls.setup {
        on_attach = require("nvchad.configs.lspconfig").on_attach,
        capabilities = require("nvchad.configs.lspconfig").capabilities,
        filetypes = { "java" },
      }
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function(_, opts)
      require("dapui").setup(opts)
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
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    -- config = function()
    --   require "custom.configs.rustaceanvim"
    -- end
  },
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
}
