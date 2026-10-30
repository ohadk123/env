return function()
    vim.lsp.config("c3_lsp", {
        cmd = { "c3lsp", "-stdlib-path", "/usr/lib/c3c/lib/std" },
    })
end
