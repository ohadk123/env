-- ================================================================================================
-- TITLE : nvim-treesitter
-- ABOUT : Treesitter configurations and abstraction layer for Neovim.
-- LINKS :
--   > github : https://github.com/nvim-treesitter/nvim-treesitter
-- ================================================================================================

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		-- language parsers that MUST be installed (main branch: setup() ignores ensure_installed)
		require("nvim-treesitter").install({
			"bash",
			"c",
			"cpp",
			"dockerfile",
			"go",
			"lua",
			"python",
			"rust",
			"c3",
			"zig",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				-- no-op if there's no parser for this filetype
				if pcall(vim.treesitter.start, args.buf) then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
