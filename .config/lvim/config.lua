reload "user.plugins"
reload "user.options"
reload "user.keymaps"
reload "user.lsp"
reload "user.neotest"
reload "user.inlay-hints"
reload "user.telescope"
reload "user.treesitter"
reload "user.lualine"
reload "user.scrollbar"
reload "user.whichkey"

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

lvim.log.level = "info"
lvim.leader = "space"
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.auto_install = true


local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
keymap('n', '<F2>', [[:NvimTreeToggle<CR>]], { desc = "NvimTree" })
