-- ================================================================================================
-- TITLE : nvim-lspconfig
-- ABOUT : Quickstart configurations for the built-in Neovim LSP client.
-- LINKS :
--   > github                  : https://github.com/neovim/nvim-lspconfig
--   > mason.nvim (dep)        : https://github.com/mason-org/mason.nvim
-- ================================================================================================

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim", opts = {
            registries = {
                "github:mason-org/mason-registry",
            },
            providers = {
                "mason.providers.client",
            },
        } }, -- LSP/DAP/Linter installer & manager
    },
    config = function()
        require("utils.diagnostics").setup()
        require("servers")
    end,
}
