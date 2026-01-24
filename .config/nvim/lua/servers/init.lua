local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Language Server Protocol (LSP)
require("servers.lua_ls")(capabilities)
require("servers.pyright")(capabilities)
require("servers.gopls")(capabilities)
require("servers.bashls")(capabilities)
require("servers.clangd")(capabilities)

-- Linters & Formatters
require("servers.efm-langserver")(capabilities)

vim.lsp.enable({
  'lua_ls',
  'pyright',
  'gopls',
  'bashls',
  'clangd',
  'efm',
})
