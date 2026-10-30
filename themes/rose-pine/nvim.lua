-- Inlay hints as plain ghost text (rose-pine gives them a blended background)
require("rose-pine").setup({ highlight_groups = { LspInlayHint = { fg = "muted", inherit = false } } })
vim.cmd.colorscheme("rose-pine")
