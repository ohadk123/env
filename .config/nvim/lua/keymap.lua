vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
-- Open explorer
map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]SP [F]ormat" })

map("n", "<C-Space>", vim.lsp.buf.hover, { desc = "LSP Hover" })

-- Git Fugitive
map("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })

-- Harpoon
local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
    harpoon:list():add()
end, { desc = "[A]dd File to Harpoon" })
vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Open Harpoon List" })

vim.keymap.set("n", "<leader>1", function()
    harpoon:list():select(1)
end, { desc = "Goto File [1]" })
vim.keymap.set("n", "<leader>2", function()
    harpoon:list():select(2)
end, { desc = "Goto File [2]" })
vim.keymap.set("n", "<leader>3", function()
    harpoon:list():select(3)
end, { desc = "Goto File [3]" })
vim.keymap.set("n", "<leader>4", function()
    harpoon:list():select(4)
end, { desc = "Goto File [4]" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
    harpoon:list():prev()
end, { desc = "[S]witch to [P]revious File" })
vim.keymap.set("n", "<C-S-N>", function()
    harpoon:list():next()
end, { desc = "[S]witch to [N]ext File" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sp", builtin.git_files, { desc = "[S]earch [P]roject" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sr", builtin.oldfiles, { desc = "[S]earch [R]ecent Files" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })

vim.keymap.set("n", "<leader>su", function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
end, { desc = "[S]earch Word [U]nder Cursor" })

vim.keymap.set("n", "<leader>sw", function()
    builtin.grep_string({ search = vim.fn.input("Grep >") })
end, { desc = "[S]earch [W]ord by Grep" })

-- UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle [U]ndo tree" })
