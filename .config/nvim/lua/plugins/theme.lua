-- Colorschemes, picked by ~/env/themes/current/nvim.lua (see config/autocmds.lua).
-- lazy.nvim loads each one on demand when :colorscheme asks for it.
return {
    { "rose-pine/neovim", name = "rose-pine", lazy = true },
    { "catppuccin/nvim", name = "catppuccin", lazy = true },
    { "ellisonleao/gruvbox.nvim", lazy = true },
    { "rebelot/kanagawa.nvim", lazy = true },
    { "loctvl842/monokai-pro.nvim", lazy = true },
    { "nyoom-engineering/oxocarbon.nvim", lazy = true, build = false }, -- ships compiled Lua; skip its luarocks/fennel build
    { "datsfilipe/vesper.nvim", lazy = true },
}
