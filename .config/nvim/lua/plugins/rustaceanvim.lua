-- ================================================================================================
-- TITLE : rustaceanvim
-- ABOUT : A heavily modified fork of rust-tools.nvim
-- LINKS :
--   > github : https://github.com/mrcjkb/rustaceanvim
-- ================================================================================================

return {
    "mrcjkb/rustaceanvim",
    version = "^8",
    lazy = false,
    config = function()
        local blink_capabilities = require("blink.cmp").get_lsp_capabilities()
        local ra_capabilities = require("rustaceanvim.config.server").create_client_capabilities()
        local capabilities = vim.tbl_deep_extend("force", ra_capabilities, blink_capabilities)
        vim.g.rustaceanvim = {
            server = {
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            allFeatures = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            },
        }
    end,
}
