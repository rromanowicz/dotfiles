-- Additional Plugins
lvim.plugins = {
  "lunarvim/github.nvim",
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "mfussenegger/nvim-jdtls",
  { "christianchiarulli/telescope-tabs", branch = "chris" },
  "lvimuser/lsp-inlayhints.nvim",
  "monaqa/dial.nvim",
  "nvim-neotest/neotest",
  "jose-elias-alvarez/null-ls.nvim",
  {
    'folke/trouble.nvim',
    config = function()
      require("trouble").setup {
        mode = "document_diagnostics",
      }
    end,
  },

  -- Colorschemes
  "catppuccin/nvim",
  "nyngwang/nvimgelion",
}
