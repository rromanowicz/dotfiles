local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  d = { 
    name = "[D]efinitions",
    h = { vim.lsp.buf.hover, "Hover Documentation" },
    d = { vim.lsp.buf.type_definition, "Type [D]efinition" },
    s = { vim.lsp.buf.signature_help, "[S]ignature Documentation" },
    s = { require('telescope.builtin').lsp_document_symbols, "[D]ocument [S]ymbols" },
  },
  j= {
    name = "[J]ava",
    o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
    v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
    c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
    t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
    T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
    u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
    r = { vim.lsp.buf.rename, "[R]ename" },
    a = { vim.lsp.buf.code_action, "Code [A]ction" },
    F = { vim.lsp.buf.format, "[F]ormat code"},
  },
  g = {
    name = "[G]o",
    d = { vim.lsp.buf.definition, "[G]oto [D]efinition" },
    D = { vim.lsp.buf.declaration, "[G]oto [D]eclaration" },
    r = { require('telescope.builtin').lsp_references, "[G]oto [R]eferences" },
    I = { vim.lsp.buf.implementation, "[G]oto [I]mplementation" },
  },
  w = {
    name = "[W]orkspace",
    a = { vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder" },
    r = { vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder" },
    r = { vim.lsp.buf.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols" },
    l = { function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, "[W]orkspace [L]ist Folders" },
  },
}

local vmappings = {
  j = {
    name = "[J]ava",
    v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable" },
    c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
    m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
  },
}

which_key.register(mappings, opts)
which_key.register(vmappings, vopts)