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
        { "mason-org/mason.nvim", opts = {} }, -- LSP/DAP/Linter installer & manager
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local S = vim.diagnostic.severity
        local icons = {
            [S.ERROR] = " ",
            [S.WARN] = " ",
            [S.INFO] = "",
            [S.HINT] = "",
        }
        vim.diagnostic.config({
            severity_sort = true,
            float = { border = "rounded", source = "if_many" },
            underline = { severity = S.ERROR },
            signs = { text = icons },
            virtual_text = {
                source = "if_many",
                spacing = 2,
                format = function(d) return icons[d.severity] .. d.message end,
            },
        })
        require("servers")
    end,
}
