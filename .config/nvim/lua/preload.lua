-- Keymap
keymap = function(mode, before, after, opts)
    new_opts = { noremap = true, silent = true }
    if opts ~= nil then
        new_opts = vim.tbl_extend("force", new_opts, opts)
    end
    vim.keymap.set(mode, before, after, new_opts)
end
map = function(before, after, opts)
    keymap("", before, after, { noremap = false })
end
noremap = function(before, after, opts)
    keymap("", before, after, opts)
end
nnoremap = function(before, after, opts)
    keymap("n", before, after, opts)
end
inoremap = function(before, after, opts)
    keymap("i", before, after, opts)
end
vnoremap = function(before, after, opts)
    keymap("v", before, after, opts)
end
nvnoremap = function(before, after, opts)
    nnoremap(before, after, opts)
    vnoremap(before, after, opts)
end

-- Autocmd
on_lsp_attach = function(callback)
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = callback,
    })
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH
