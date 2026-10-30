-- ================================================================================================
-- TITLE : bashls (Bash Language Server) LSP Setup
-- LINKS :
--   > github: https://github.com/bash-lsp/bash-language-server
-- ================================================================================================

--- @return nil
return function()
    vim.lsp.config("bashls", {
        filetypes = { "sh", "bash", "zsh" },
    })
end
