-- ================================================================================================
-- TITLE : auto-commands
-- ABOUT : automatically run code on defined events (e.g. save, yank)
-- ================================================================================================

-- Restore last cursor position when reopening a file
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
    group = last_cursor_group,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = highlight_yank_group,
    pattern = "*",
    callback = function()
        vim.hl.on_yank({
            higroup = "IncSearch",
            timeout = 200,
        })
    end,
})

-- format on save using efm langserver and configured formatters
local lsp_fmt_group = vim.api.nvim_create_augroup("FormatOnSaveGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_fmt_group,
    callback = function()
        local efm = vim.lsp.get_clients({ name = "efm" })
        if vim.tbl_isempty(efm) then
            return
        end
        vim.lsp.buf.format({ name = "efm", async = true })
    end,
})

-- Colorscheme from ~/env/themes/current; apply-color.sh sends SIGUSR1 to switch running instances
local function apply_theme()
    vim.o.background = "dark"
    local ok, err = pcall(dofile, vim.fn.expand("~/env/themes/current/nvim.lua"))
    if not ok then
        vim.notify("theme: " .. err, vim.log.levels.WARN)
    end
end
apply_theme()
vim.api.nvim_create_autocmd("Signal", { pattern = "SIGUSR1", callback = apply_theme })
