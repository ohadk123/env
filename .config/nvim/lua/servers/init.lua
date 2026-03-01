local capabilities = require("blink.cmp").get_lsp_capabilities()

require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",
        "lua_ls",
        "bashls",
        "pyright",
    },
})

-- Language Server Protocol (LSP)
require("servers.lua_ls")(capabilities)
require("servers.pyright")(capabilities)
require("servers.gopls")(capabilities)
require("servers.bashls")(capabilities)
require("servers.clangd")(capabilities)
require("servers.c3lsp")(capabilities)

vim.lsp.enable({
    'lua_ls',
    'pyright',
    'gopls',
    'bashls',
    'clangd',
    'c3lsp',
})
