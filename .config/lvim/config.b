reload "user.plugins"
reload "user.options"
reload "user.keymaps"
-- reload "user.autocommands"
reload "user.lsp"
reload "user.neotest"
reload "user.inlay-hints"
reload "user.telescope"
reload "user.treesitter"
reload "user.lualine"
reload "user.scrollbar"
reload "user.whichkey"


local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")

local keymap = vim.keymap.set

-- keymap("n", "<left>", "<C-w>h", opts)
-- keymap("n", "<down>", "<C-w>j", opts)
-- keymap("n", "<up>", "<C-w>k", opts)
-- keymap("n", "<right>", "<C-w>l", opts)

-- keymap("n", "<m-h>", "<C-w>h", opts)
-- keymap("n", "<m-j>", "<C-w>j", opts)
-- keymap("n", "<m-k>", "<C-w>k", opts)
-- keymap("n", "<m-l>", "<C-w>l", opts)
-- keymap("n", "<m-tab>", "<c-6>", opts)
keymap('n', '<F2>', [[:NvimTreeToggle<CR>]], { desc = "NvimTree" })
-- -- require("lsp_lines").setup()
