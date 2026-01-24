-- ================================================================================================
-- TITLE : efm-langserver
-- ABOUT : a general purpose language server protocol implemented here for linters/formatters
-- LINKS :
--   > github : https://github.com/mattn/efm-langserver
--   > configs: https://github.com/creativenull/efmls-configs-nvim/tree/main
-- ================================================================================================

--- @param capabilities table LSP client capabilities (from nvim-cmp)
--- @return nil
return function(capabilities)
    local luacheck = require("efmls-configs.linters.luacheck")        -- lua linter
    local stylua = require("efmls-configs.formatters.stylua")         -- lua formatter
    local flake8 = require("efmls-configs.linters.flake8")            -- python linter
    local black = require("efmls-configs.formatters.black")           -- python formatter
    local go_revive = require("efmls-configs.linters.go_revive")      -- go linter
    local gofumpt = require("efmls-configs.formatters.gofumpt")       -- go formatter
    local shellcheck = require("efmls-configs.linters.shellcheck")    -- bash linter
    local shfmt = require("efmls-configs.formatters.shfmt")           -- bash formatter
    local clanglint = require("efmls-configs.linters.clang_format")   -- c/cpp linter
    local clangformat = require("efmls-configs.formatters.clang_format") -- c/cpp formatter

    vim.lsp.config("efm", {
        capabilities = capabilities,
        filetypes = {
            "c",
            "cpp",
            "docker",
            "go",
            "lua",
            "python",
            "sh",
            "rust",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true,
        },
        settings = {
            languages = {
                c = { clangformat, clanglint },
                cpp = { clangformat, clanglint },
                go = { gofumpt, go_revive },
                lua = { luacheck, stylua },
                python = { flake8, black },
                sh = { shellcheck, shfmt },
            },
        },
    })
end
