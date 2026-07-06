return function(capabilities)
    vim.lsp.config("c3lsp", {
        capabilities = capabilities,
        cmd = { "c3lsp", "-stdlib-path", "/usr/lib/c3c/lib/std" },
        root_markers = { "project.json", "manifest.json", ".git" },
        filetypes = { "c3", "c3i" },
    })
end
