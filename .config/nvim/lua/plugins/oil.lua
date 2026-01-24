-- ================================================================================================
-- TITLE : oil-nvim.lua
-- ABOUT : A file explorer buffer for Neovim, written in Lua.
-- LINKS :
--   > github : https://github.com/stevearc/oil.nvim
-- ================================================================================================
--
return {
	"stevearc/oil.nvim",
	---@module 'oil'
	opts = {
		columns = {
			"icon",
			"permissions",
			"size",
		},

		win_options = {
			wrap = true,
			signcolumn = "yes",
			winbar = "%{v:lua.require('oil').get_current_dir()}",
		},

		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,

		view_options = {
			show_hidden = true,
		},

		float = {
			max_width = 0.8,
			max_height = 0.8,
			border = "rounded",
		},

		confirmation = {
			border = "rounded",
		},

		progress = {
			border = "rounded",
		},

		ssh = {
			border = "rounded",
		},

		keymaps_help = {
			border = "rounded",
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
