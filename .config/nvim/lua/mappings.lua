require "nvchad.mappings"

-- add yours here
-- Conversion
-- '<,'>s/.*\([a-z]\).=.{.\(.*\),.\(.*\).}/map("n", "<leader>l\1", \2, {desc=\3})/

local map = vim.keymap.set
local nomap = vim.keymap.del

--Disable default mappings
-- nomap("n", "<leader>ca")
nomap("n", "<leader>cc")
nomap("n", "<leader>cm")
nomap("n", "<leader>ch")
nomap("n", "<leader>ma")

map("n", "<C-S-p>", "<cmd> vertical resize -5 <CR>", { desc = "Vertical resize -5" })
map("n", "<C-S-\\>", "<cmd> vertical resize +5 <CR>", { desc = "Vertical resize +5" })

map("n", "<leader>c", "<cmd> NvCheatsheet <cr>", { desc = "Nv[C]heatSheet" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>z", ":lua require('zen-mode').toggle({})<cr>", { desc = "Toggle [z]enmode" })

map("n", "<leader>f", "", { desc = "[F]ind" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>l", "", { desc = "[L]SP" })
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = " LSP Code Action" })
map("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", { desc = "LSP Buffer Diagnostics" })
map("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "LSP Diagnostics" })
map("n", "<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "LSP References" })
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", { desc = "LSP Format" })
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", { desc = "LSP Next Diagnostic" })
map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", { desc = "LSP Prev Diagnostic" })
map("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "LSP CodeLens Action" })
map("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", { desc = "LSP Quickfix" })
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "LSP Rename" })
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "LSP Document Symbols" })
map("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "LSP Workspace Symbols" })
map("n", "<leader>le", "<cmd>Telescope quickfix<cr>", { desc = "LSP Telescope Quickfix" })

map("n", "<leader>t", "", { desc = "[T]ab" })
map("n", "<leader>tn", "<cmd>tabnew %<cr>", { desc = "Tab New" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Tab Close" })
map("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Tab Only" })

map("n", "<leader>d", "", { desc = "[D]efinitions" })
map("n", "<leader>dh", vim.lsp.buf.hover, { desc = "Def Hover Documentation" })
map("n", "<leader>dd", vim.lsp.buf.definition, { desc = "Def Definition" })
map("n", "<leader>dD", vim.lsp.buf.type_definition, { desc = "Def Type Definition" })
map("n", "<leader>dr", vim.lsp.buf.references, { desc = "Def References" })
map("n", "<leader>dS", vim.lsp.buf.signature_help, { desc = "Def Signature Documentation" })
map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { desc = "Def Document Symbols" })

map("n", "<leader>g", "", { desc = "[G]it" })
map(
  "n",
  "<leader>gg",
  "<cmd>require('nvchad.term').toggle { pos = 'float', id = 'floa', cmd = 'lazygit' }<cr>",
  { desc = "Git Lazygit" }
)
map(
  "n",
  "<leader>gj",
  "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
  { desc = "Git Next Hunk" }
)
map(
  "n",
  "<leader>gk",
  "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
  { desc = "Git Prev Hunk" }
)
map("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Git Blame" })
map("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Git Preview Hunk" })
map("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Git Reset Hunk" })
map("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = "Git Reset Buffer" })
map("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Git Stage Hunk" })
map("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = "Git Undo Stage Hunk" })
map("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Git Open changed file" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git Checkout branch" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git Checkout commit" })
map("n", "<leader>gC", "<cmd>Telescope git_bcommits<cr>", { desc = "Git Checkout commit(for current file)" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "Git Git Diff" })

map("n", "<leader>D", "", { desc = "[D]ebug" })
map("n", "<leader>Db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Debug Breakpoint" })
map("n", "<leader>Dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Debug Continue (F5)" })
map("n", "<leader>Di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Debug Into (F7)" })
map("n", "<leader>Do", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Debug Over (F8)" })
map("n", "<leader>DO", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Debug Out (S-F8)" })
map("n", "<leader>Dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Debug Repl" })
map("n", "<leader>Dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Debug Run Last" })
map("n", "<leader>Du", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "Debug UI" })
map("n", "<leader>Dx", "<cmd>lua require'dap'.terminate()<cr>", { desc = "Debug Exit" })

map("n", "<leader>j", "", { desc = "[J]ava" })
map("n", "<leader>jp", "<cmd>JavaBuildBuildWorkspace<cr>", { desc = "Java [B]uild Workspace" })
map("n", "<leader>jp", "<cmd>JavaBuildCleanWorkspace<cr>", { desc = "Java [C]lean/Build Workspace" })
map("n", "<leader>jp", "<cmd>JavaProfile<cr>", { desc = "Java [P]rofile" })
map("n", "<leader>jr", "<cmd>JavaRunnerRunMain<cr>", { desc = "Java [R]un Main" })
map("n", "<leader>js", "<cmd>JavaRunnerStopMain<cr>", { desc = "Java [S]top Main" })
map("n", "<leader>jl", "<cmd>JavaRunnerToggleLogs<cr>", { desc = "Java Toggle [L]ogs" })
map("n", "<leader>jt", "", { desc = "[T]est" })
map("n", "<leader>jtC", "<cmd>JavaTestDebugCurrentClass<cr>", { desc = "Java Test Debug Current [C]lass" })
map("n", "<leader>jtM", "<cmd>JavaTestDebugCurrentMethod<cr>", { desc = "Java Test Debug Current [M]ethod" })
map("n", "<leader>jtc", "<cmd>JavaTestRunCurrentClass<cr>", { desc = "Java Test Run Current [c]lass" })
map("n", "<leader>jtm", "<cmd>JavaTestRunCurrentMethod<cr>", { desc = "Java Test Run Current [m]ethod" })
map("n", "<leader>jtr", "<cmd>JavaTestViewLastReport<cr>", { desc = "Java Test [R]eport" })
map("n", "<leader>je", "", { desc = "[E]xtract" })
map("n", "<leader>jeC", "<cmd>JavaRefactorExtractConstant<cr>", { desc = "Java Extract [C]onstant" })
map("n", "<leader>jev", "<cmd>JavaRefactorExtractVariable<cr>", { desc = "Java Extract [v]ariable" })
map("n", "<leader>jeV", "<cmd>JavaRefactorExtractVariableAllOccurence<cr>", { desc = "Java Extract [V]ariable" })
map("n", "<leader>jem", "<cmd>JavaRefactorExtractMethod<cr>", { desc = "Java Extract [M]ethod" })
map("n", "<leader>jef", "<cmd>JavaRefactorExtractField<cr>", { desc = "Java Extract [F]ield" })
