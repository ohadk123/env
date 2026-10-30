local servers = { "lua_ls", "pyright", "gopls", "bashls", "clangd", "c3_lsp" }

require("mason-lspconfig").setup({ ensure_installed = servers })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
                },
            },
        },
    },
})

vim.lsp.config("pyright", {
    settings = {
        pyright = {
            disableOrganizeImports = false,
            analysis = {
                useLibraryCodeForTypes = true,
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                autoImportCompletions = true,
            },
        },
    },
})

vim.lsp.config("gopls", { filetypes = { "go" } })

vim.lsp.config("bashls", { filetypes = { "sh", "bash", "zsh" } })

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
        "--header-insertion=never",
        "--pch-storage=memory",
        "--cross-file-rename",
        "--suggest-missing-includes",
    },
    filetypes = { "c", "cpp" },
})

vim.lsp.config("c3_lsp", {
    cmd = { "c3lsp", "-stdlib-path", "/usr/lib/c3c/lib/std" },
})

vim.lsp.enable(servers)
