local map = vim.keymap.set

map("n", "<c-n>", ":NvimTreeToggle<cr>")
map("n", "<Tab>", ":bnext<cr>")
map("n", "<s-Tab>", ":bprev<cr>")

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<C-S-p>", "<cmd> vertical resize -5 <CR>", { desc = "Vertical resize -5" })
map("n", "<C-S-\\>", "<cmd> vertical resize +5 <CR>", { desc = "Vertical resize +5" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

