local lspconfig = require("lspconfig")

lspconfig.jdtls.setup({
    init_options = {
        bundles = require("spring_boot").java_extensions(),
    },
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-19",
                        path = "~/.jdk/jdk-19.0.2/Contents/Home/",
                    },
                    {
                        name = "JavaSE-21",
                        path = "~/.jdk/jdk-21/Contents/Home/",
                    },
                },
            },
        },
    },
})

lspconfig.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
            rustc = {
                source = "discover",
            }
        },
    },
}

on_lsp_attach(function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
end)

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                pathStrict = true,
                path = { "?.lua", "?/init.lua" },
            },
            workspace = {
                library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
                    "${3rd}/luv/library",
                    "${3rd}/busted/library",
                    "${3rd}/luassert/library",
                }),
                checkThirdParty = "Disable",
            },
        },
    },
})
