local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Language Server Protocol (LSP)
require("servers.lua_ls")(capabilities)
require("servers.pyright")(capabilities)
require("servers.gopls")(capabilities)
require("servers.bashls")(capabilities)
require("servers.clangd")(capabilities)

vim.lsp.enable({
  'lua_ls',
  'pyright',
  'gopls',
  'bashls',
  'clangd',
})
