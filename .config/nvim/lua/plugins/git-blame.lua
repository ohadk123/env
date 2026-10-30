-- ================================================================================================
-- TITLE : git-blame.nvim
-- ABOUT : A git blame plugin for Neovim
-- LINKS :
--   > github : https://github.com/f-person/git-blame.nvim
-- ================================================================================================

return {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		message_template = " <summary> • <date> • <author>",
		date_format = "%r",
		virtual_text_column = 1,
	},
}
