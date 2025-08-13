vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
-- Open explorer
map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]SP [F]ormat" })

map("n", "<C-Space>", vim.lsp.buf.hover, { desc = "LSP Hover" })
