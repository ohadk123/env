vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- local map = vim.keymap.set

local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { desc = desc })
        end

-- LSP
map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction")
map("<leader>lf", vim.lsp.buf.format, "[L]SP [F]ormat")

-- Open explorer
map("<leader>pv", vim.cmd.Ex, "Directory View")

map("<C-Space>", vim.lsp.buf.hover,"LSP Hover")

-- Git Fugitive
map("<leader>gs", vim.cmd.Git,"[G]it [S]tatus")

-- FzfLua - Fuzzy Finder
require("fzf-lua")
map("<leader>sf", FzfLua.files,"[S]earch [F]iles")
map("<leader>sp", FzfLua.git_files,"[S]earch [P]roject")
map("<leader>sk", FzfLua.keymaps,"[S]earch [K]eymaps")
map("<leader>sg", FzfLua.live_grep,"[S]earch by [G]rep")
map("<leader>sr", FzfLua.oldfiles,"[S]earch [R]ecent Files")
map("<leader>sh", FzfLua.help_tags,"[S]earch [H]elp")
map("<leader>su", FzfLua.grep_cword,"[S]earch Word [U]nder Cursor")
map("<leader>sS", FzfLua.lsp_live_workspace_symbols,"[S]earch Workspace [S]ymbols")
map("<leader>ss", FzfLua.lsp_document_symbols, "[S]earch Document [S]ymbols")

map("grr", FzfLua.lsp_references, "[G]oto [R]eferences")
map("gri", FzfLua.lsp_implementations, "[G]oto [I]mplementation")
map("grd", FzfLua.lsp_definitions, "[G]oto [D]efinition")
map("grD", FzfLua.lsp_declarations, "[G]oto [D]eclaration")
map("grt", FzfLua.lsp_typedefs, "[G]oto [T]ype Definition")

-- Harpoon
local harpoon = require("harpoon")

map("<leader>a", function()
    harpoon:list():add()
end,"[A]dd File to Harpoon")
map("<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end,"Open Harpoon List")

map("<leader>1", function()
    harpoon:list():select(1)
end,"Goto File [1]")
map("<leader>2", function()
    harpoon:list():select(2)
end,"Goto File [2]")
map("<leader>3", function()
    harpoon:list():select(3)
end,"Goto File [3]")
map("<leader>4", function()
    harpoon:list():select(4)
end,"Goto File [4]")

-- Toggle previous & next buffers stored within Harpoon list
map("<C-S-P>", function()
    harpoon:list():prev()
end,"[S]witch to [P]revious File")
map("<C-S-N>", function()
    harpoon:list():next()
end,"[S]witch to [N]ext File")

-- UndoTree
map("<leader>u", vim.cmd.UndotreeToggle,"Toggle [U]ndo tree")

-- Telescope
-- local builtin = require("telescope.builtin")
-- map("<leader>sf", builtin.find_files,"[S]earch [F]iles")
-- map("<leader>sp", builtin.git_files,"[S]earch [P]roject")
-- map("<leader>sk", builtin.keymaps,"[S]earch [K]eymaps")
-- map("<leader>sg", builtin.live_grep,"[S]earch by [G]rep")
-- map("<leader>sr", builtin.oldfiles,"[S]earch [R]ecent Files")
-- map("<leader>sh", builtin.help_tags,"[S]earch [H]elp")

-- map("<leader>su", function()
--     local word = vim.fn.expand("<cword>")
--     builtin.grep_string({ search = word)
-- end,"[S]earch Word [U]nder Cursor")

-- map("<leader>sw", function()
--     builtin.grep_string({ search = vim.fn.input("Grep >"))
-- end,"[S]earch [W]ord by Grep")