local M = {}

local diagnostic_signs = {
    Error = " ",
    Warn = " ",
    Hint = "",
    Info = "",
}

M.setup = function()
    vim.diagnostic.config({
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
                [vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
                [vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
                [vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
            },
        },
        virtual_text = {
            source = "if_many",
            spacing = 2,
            format = function(diagnostic)
                local diagnostic_message = {
                    [vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
                    [vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
                    [vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
                    [vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
                }
                return diagnostic_message[diagnostic.severity] .. diagnostic.message
            end,
        },
    })
end

return M
