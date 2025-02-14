local wk = require("which-key")

wk.add({
  { "<leader>f",  group = "[F]ind" }, -- group
  { "<leader>fw", "<cmd>Telescope live_grep<CR>",                                         desc = "telescope live grep" },
  { "<leader>fb", "<cmd>Telescope buffers<CR>",                                           desc = "telescope find buffers" },
  { "<leader>fh", "<cmd>Telescope help_tags<CR>",                                         desc = "telescope help page" },
  { "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>",                         desc = "telescope find in current buffer" },
  { "<leader>ff", "<cmd>Telescope find_files follow=true<cr>",                            desc = "telescope find files" },
  { "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", desc = "telescope find all files" },
  {
    "<leader>b",
    group = "buffers",
    expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
})

wk.add({
  { "<leader>l",  group = "[L]SP" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",               desc = " LSP Code Action" },
  { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "LSP Buffer Diagnostics" },
  { "<leader>lw", "<cmd>Telescope diagnostics<cr>",                       desc = "LSP Diagnostics" },
  { "<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>",                desc = "LSP References" },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>",    desc = "LSP Format" },
  { "<leader>li", "<cmd>LspInfo<cr>",                                     desc = "LSP Info" },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",    desc = "LSP Next Diagnostic" },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",    desc = "LSP Prev Diagnostic" },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",                  desc = "LSP CodeLens Action" },
  { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",        desc = "LSP Quickfix" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                    desc = "LSP Rename" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",              desc = "LSP Document Symbols" },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",     desc = "LSP Workspace Symbols" },
  { "<leader>le", "<cmd>Telescope quickfix<cr>",                          desc = "LSP Telescope Quickfix" },
})

wk.add({
  { "<leader>d",  group = "[D]efinitions" },
  { "<leader>dh", vim.lsp.buf.hover,                                 desc = "Def Hover Documentation" },
  { "<leader>dd", vim.lsp.buf.definition,                            desc = "Def Definition" },
  { "<leader>dD", vim.lsp.buf.type_definition,                       desc = "Def Type Definition" },
  { "<leader>dr", vim.lsp.buf.references,                            desc = "Def References" },
  { "<leader>dS", vim.lsp.buf.signature_help,                        desc = "Def Signature Documentation" },
  { "<leader>ds", require("telescope.builtin").lsp_document_symbols, desc = "Def Document Symbols" },
})

wk.add({
  { "<leader>g",  group = "[G]it" },
  {
    "<leader>gg",
    "<cmd>lua Lazygit_toggle()<CR>",
    desc = "Git Lazygit"
  },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Git Next Hunk" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Git Prev Hunk" },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>",                            desc = "Git Blame" },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                          desc = "Git Preview Hunk" },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                            desc = "Git Reset Hunk" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                          desc = "Git Reset Buffer" },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",                            desc = "Git Stage Hunk" },
  { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",                       desc = "Git Undo Stage Hunk" },
  { "<leader>go", "<cmd>Telescope git_status<cr>",                                           desc = "Git Open changed file" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>",                                         desc = "Git Checkout branch" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>",                                          desc = "Git Checkout commit" },
  { "<leader>gC", "<cmd>Telescope git_bcommits<cr>",                                         desc = "Git Checkout commit(for current file)" },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>",                                         desc = "Git Git Diff" },
})

wk.add({
  { "<leader>D",  group = "[D]ebug" },
  { "<leader>Db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Debug Breakpoint" },
  { "<leader>Dc", function() require('dap').continue() end,        desc = "Debug Continue (F5)" },
  { "<leader>Di", "<cmd>lua require'dap'.step_into()<cr>",         desc = "Debug Into (F7)" },
  { "<leader>Do", "<cmd>lua require'dap'.step_over()<cr>",         desc = "Debug Over (F8)" },
  { "<leader>DO", "<cmd>lua require'dap'.step_out()<cr>",          desc = "Debug Out (S-F8)" },
  { "<leader>Dr", "<cmd>lua require'dap'.repl.toggle()<cr>",       desc = "Debug Repl" },
  { "<leader>Dl", "<cmd>lua require'dap'.run_last()<cr>",          desc = "Debug Run Last" },
  { "<leader>Du", "<cmd>lua require'dapui'.toggle()<cr>",          desc = "Debug UI" },
  { "<leader>Dx", "<cmd>lua require'dap'.terminate()<cr>",         desc = "Debug Exit" },
  { "<F3>",       "<cmd>lua require('dapui').toggle()<cr>",        desc = "Toggle UI" },
  { "<F5>",       "<cmd>lua require('dap').continue()<cr>",        desc = "Continue" },
  { "<F8>",       "<cmd>lua require('dap').step_over()<cr>",       desc = "Step Over" },
  { "<F7>",       "<cmd>lua require('dap').step_into()<cr>",       desc = "Step Into" },
  { "<F9>",       "<cmd>lua require('dap').step_out()<cr>",        desc = "Step Out" },
  { "<F10>",      "<cmd>lua require('dap').terminate()<cr>",       desc = "Terminate" },
})

wk.add({
  { "<leader>j",   group = "[J]ava" },
  { "<leader>jp",  "<cmd>JavaBuildBuildWorkspace<cr>",                 desc = "Java [B]uild Workspace" },
  { "<leader>jp",  "<cmd>JavaBuildCleanWorkspace<cr>",                 desc = "Java [C]lean/Build Workspace" },
  { "<leader>jp",  "<cmd>JavaProfile<cr>",                             desc = "Java [P]rofile" },
  { "<leader>jr",  "<cmd>JavaRunnerRunMain<cr>",                       desc = "Java [R]un Main" },
  { "<leader>js",  "<cmd>JavaRunnerStopMain<cr>",                      desc = "Java [S]top Main" },
  { "<leader>jl",  "<cmd>JavaRunnerToggleLogs<cr>",                    desc = "Java Toggle [L]ogs" },
  { "<leader>jt",  "",                                                 desc = "[T]est" },
  { "<leader>jtC", "<cmd>JavaTestDebugCurrentClass<cr>",               desc = "Java Test Debug Current [C]lass" },
  { "<leader>jtM", "<cmd>JavaTestDebugCurrentMethod<cr>",              desc = "Java Test Debug Current [M]ethod" },
  { "<leader>jtc", "<cmd>JavaTestRunCurrentClass<cr>",                 desc = "Java Test Run Current [c]lass" },
  { "<leader>jtm", "<cmd>JavaTestRunCurrentMethod<cr>",                desc = "Java Test Run Current [m]ethod" },
  { "<leader>jtr", "<cmd>JavaTestViewLastReport<cr>",                  desc = "Java Test [R]eport" },
  { "<leader>je",  "",                                                 desc = "[E]xtract" },
  { "<leader>jeC", "<cmd>JavaRefactorExtractConstant<cr>",             desc = "Java Extract [C]onstant" },
  { "<leader>jev", "<cmd>JavaRefactorExtractVariable<cr>",             desc = "Java Extract [v]ariable" },
  { "<leader>jeV", "<cmd>JavaRefactorExtractVariableAllOccurence<cr>", desc = "Java Extract [V]ariable" },
  { "<leader>jem", "<cmd>JavaRefactorExtractMethod<cr>",               desc = "Java Extract [M]ethod" },
  { "<leader>jef", "<cmd>JavaRefactorExtractField<cr>",                desc = "Java Extract [F]ield" },
})

wk.add({
  { "<leader>t",  group = "[T]erminal" },
  { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal" },
  { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>",   desc = "Vertical" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",      desc = "Float" },
})

wk.add({
  { "<leader>w",  group = "[W]hichKey" },
  { "<leader>wK", "<cmd>WhichKey <CR>",                                             desc = "whichkey all keymaps" },
  { "<leader>wk", function() vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ") end, desc = "whichkey query lookup" },
})

wk.add({
  { "<leader>/", "gcc",                                     desc = "toggle comment",   remap = true, mode = "n", hidden = true },
  { "<leader>/", "gc",                                      desc = "toggle comment",   remap = true, mode = "v", hidden = true },
  { "<leader>z", ":lua require('zen-mode').toggle({})<cr>", desc = "Toggle [z]enmode", hidden = true },
  { "<leader>x", "<cmd>bd<cr>",                             desc = "Close buffer",     hidden = true },
})
