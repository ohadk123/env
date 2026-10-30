-- ================================================================================================
-- TITLE : gopls (Golang Language Server) LSP Setup
-- LINKS :
--   > github: https://github.com/golang/tools/tree/master/gopls
-- ================================================================================================

--- @return nil
return function()
    vim.lsp.config('gopls', {
        filetypes = { "go" },
    })
end
