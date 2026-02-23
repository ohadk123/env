local map = function(keys, func, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { desc = desc })
end

local wk = require("which-key")

-- Visual mode find and replace
map("<C-r>", "\"hy:%s/<C-r>h/<C-r>h/gc<left><left><left>", "[R]eplace highlighted text", "v")

-- Write and Quit keymaps
map("Q", ":q<CR>", "[Q]uit");
map("W", ":w<CR>", "[W]rite");

-- File Explorer
map("-", ":Oil<CR>", "Directory View")
map("<leader>ed", ":lua MiniFiles.open()<CR>", "Open [E]xplorer in current [D]irectory")
map("<leader>ef", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
    end,
    "Open [E]xplorer in current [F]ile"
)

-- Terminal
map("T", "<C-w>v:term<CR>", "Open [T]erminal in vertical split")
map("<Esc>", "<C-\\><C-n>", "Exit terminal mode", "t")

-- Claude Code - with persistent width
map("<leader>cC", ":ClaudeCode<CR>:setl wfw<CR>")
map("<C-c>", ":ClaudeCodeContinue<CR>:setl wfw<CR>")

-- Center screen when jumping
map("n", "nzzzv", "Next search result (centered)")
map("N", "Nzzzv", "Previous search result (centered)")
map("<C-d>", "<C-d>zz", "Half page down (centered)")
map("<C-u>", "<C-u>zz", "Half page up (centered)")

-- Better indenting in visual mode
map("<", "<gv", "Indent left and reselect", "v")
map(">", ">gv", "Indent right and reselect", "v")

-- Move lines
map("<M-k>", ":m '<-2<CR>gv=gv", "Move selected lines up", "v")
map("<M-j>", ":m '>+1<CR>gv=gv", "Move selected lines down", "v")

-- Better J behavior - keep cursor position
map("J", "mzJ`z", "[J]oin lines")

-- Quick config editing
map("<leader>rc", "<Cmd>e ~/.config/nvim<CR>", "Edit config")

-- FzfLua - Fuzzy Finder
wk.add({ { "<leader>s", group = "[S]earch" } })
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

-- Git Shortcuts
wk.add({ { "<leader>g", group = "[G]it" } })
map("<leader>gs", FzfLua.git_status, "[S]tatus")
map("<leader>gb", FzfLua.git_branches, "[B]ranches")
map("<leader>gt", FzfLua.git_tags, "[T]ags")
map("<leader>gd", FzfLua.git_diff, "[D]iff")
map("<leader>gc", FzfLua.git_commits, "[C]ommits")

-- LSP Shortcuts
wk.add({ { "<leader>l", group = "[L]SP" } })
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
map("<leader>ldd", FzfLua.diagnostics_document, "[D]ocument [D]iagnostics")
map("<leader>lwd", FzfLua.diagnostics_workspace, "[W]orkspace [D]iagnostics")
map("<C-Space>", vim.lsp.buf.hover, "LSP Hover")

-- Align.nvim - align lines
wk.add({ { "<leader>a", group = "[A]lign" } })
local align = require("align")
map("<leader>aa", function() align.align_to_char({ length = 1, }) end, "1 character", "x")
map("<leader>aA", function() align.align_to_char({ length = 2, }) end, "2 characters", "x")
map("<leader>as", function() align.align_to_string({ preview = true, regex = false }) end, "string", "x")


-- Multicursor - change multiple lines at once
local mc = require("multicursor-nvim")

map("<up>", function() mc.lineAddCursor(-1) end, "Add cursor on line above", { "n", "x" })
map("<down>", function() mc.lineAddCursor(1) end, "Add cursor on line below", { "n", "x" })
map("<leader><up>", function() mc.lineSkipCursor(-1) end, "Skip line above", { "n", "x" })
map("<leader><down>", function() mc.lineSkipCursor(1) end, "Skip line below", { "n", "x" })
map("<leader>n", function() mc.matchAddCursor(1) end, "Add cursor on match below", { "n", "x" })
map("<leader>N", function() mc.matchAddCursor(-1) end, "Add cursor on match above", { "n", "x" })
map("<leader>s", function() mc.matchSkipCursor(1) end, "Skip cursor on match below", { "n", "x" })
map("<leader>S", function() mc.matchSkipCursor(-1) end, "Skip cursor on match above", { "n", "x" })
map("<c-leftmouse>", mc.handleMouse)
map("<c-leftdrag>", mc.handleMouseDrag)
map("<c-leftmouse>", mc.handleMouseRelease)
map("<c-q>", mc.toggleCursor, "", { "n", "x" })

-- Sessions
local per = require("persistence")
map("<leader>ss", function() per.select() end, "[S]ession")
