vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- local map = vim.keymap.set

local map = function(keys, func, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Personal
map("<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>", "[R]eplace highlighted text", "v")
map("Q", ":q<CR>", "[Q]uit");
map("W", ":w<CR>", "[W]rite");
map("<leader>pv", vim.cmd.Ex, "Directory View")


-- FzfLua - Fuzzy Finder
require("fzf-lua")
map("<leader>sf", FzfLua.files, "[F]iles")
map("<leader>sb", FzfLua.buffers, "[B]uffers")
map("<leader>sp", FzfLua.git_files, "[P]roject")
map("<leader>sk", FzfLua.keymaps, "[K]eymaps")
map("<leader>sG", FzfLua.live_grep, "[G]rep in project")
map("<leader>sg", FzfLua.grep_curbuf, "[G]rep in buffer")
map("<leader>sv", FzfLua.grep_visual, "[V]isual Selection")
map("<leader>sr", FzfLua.oldfiles, "[R]ecent Files")
map("<leader>sh", FzfLua.help_tags, "[H]elp")
map("<leader>su", FzfLua.grep_cword, "Word [U]nder Cursor")
-- map("<leader>sd", FzfLua.)

-- Git Shortcuts
map("<leader>gs", FzfLua.git_status, "[S]tatus")
map("<leader>gb", FzfLua.git_blame, "[B]lame")
map("<leader>gt", FzfLua.git_tags, "[T]ags")
map("<leader>gd", FzfLua.git_diff, "[D]iff")
map("<leader>gc", FzfLua.git_commits, "[C]ommits")

-- LSP Shortcuts
map("<leader>lr", FzfLua.lsp_references, "[R]eferences")
map("<leader>li", FzfLua.lsp_implementations, "[I]mplementation")
map("<leader>ld", FzfLua.lsp_definitions, "[D]efinition")
map("<leader>lD", FzfLua.lsp_declarations, "[D]eclaration")
map("<leader>lt", FzfLua.lsp_typedefs, "[T]ype Definition")
map("<leader>ls", FzfLua.lsp_document_symbols, "[S]earch Document [S]ymbols")
map("<leader>lS", FzfLua.lsp_live_workspace_symbols, "[S]earch Workspace [S]ymbols")
map("<leader>la", FzfLua.lsp_code_actions, "Code [A]ctions")
map("<leader>lf", vim.lsp.buf.format, "[F]ormat")
map("<leader>lR", vim.lsp.buf.rename, "[R]ename")
map("<C-Space>", vim.lsp.buf.hover, "LSP Hover")

-- Harpoon
local harpoon = require("harpoon")

map("<leader>a", function()
    harpoon:list():add()
end, "[A]dd File to Harpoon")
map("<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, "Open Harpoon List")

map("<leader>1", function()
    harpoon:list():select(1)
end, "Goto File [1]")
map("<leader>2", function()
    harpoon:list():select(2)
end, "Goto File [2]")
map("<leader>3", function()
    harpoon:list():select(3)
end, "Goto File [3]")
map("<leader>4", function()
    harpoon:list():select(4)
end, "Goto File [4]")

-- Toggle previous & next buffers stored within Harpoon list
map("<C-S-P>", function()
    harpoon:list():prev()
end, "[S]witch to [P]revious File")
map("<C-S-N>", function()
    harpoon:list():next()
end, "[S]witch to [N]ext File")

-- UndoTree
map("<leader>u", vim.cmd.UndotreeToggle, "Toggle [U]ndo tree")

-- Multicurser
local mc = require("multicursor-nvim")
mc.setup()

local set = vim.keymap.set

-- Add or skip cursor above/below the main cursor.
set({ "n", "x" }, "<up>", function() mc.lineAddCursor(-1) end)
set({ "n", "x" }, "<down>", function() mc.lineAddCursor(1) end)
set({ "n", "x" }, "<leader><up>", function() mc.lineSkipCursor(-1) end)
set({ "n", "x" }, "<leader><down>", function() mc.lineSkipCursor(1) end)

-- Add or skip adding a new cursor by matching word/selection
set({ "n", "x" }, "<leader>n", function() mc.matchAddCursor(1) end)
set({ "n", "x" }, "<leader>s", function() mc.matchSkipCursor(1) end)
set({ "n", "x" }, "<leader>N", function() mc.matchAddCursor(-1) end)
set({ "n", "x" }, "<leader>S", function() mc.matchSkipCursor(-1) end)

-- Add and remove cursors with control + left click.
set("n", "<c-leftmouse>", mc.handleMouse)
set("n", "<c-leftdrag>", mc.handleMouseDrag)
set("n", "<c-leftrelease>", mc.handleMouseRelease)

-- Disable and enable cursors.
set({ "n", "x" }, "<c-q>", mc.toggleCursor)

-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
mc.addKeymapLayer(function(layerSet)
    -- Select a different cursor as the main one.
    layerSet({ "n", "x" }, "<left>", mc.prevCursor)
    layerSet({ "n", "x" }, "<right>", mc.nextCursor)

    -- Delete the main cursor.
    layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

    -- Enable and clear cursors using escape.
    layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end)
end)

-- Customize how cursors look.
local hl = vim.api.nvim_set_hl
hl(0, "MultiCursorCursor", { reverse = true })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MultiCursorSign", { link = "SignColumn" })
hl(0, "MultiCursorMatchPreview", { link = "Search" })
hl(0, "MultiCursorDisabledCursor", { reverse = true })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
