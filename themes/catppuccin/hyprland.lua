-- Catppuccin Frappé

local rosewater = "rgb(f2d5cf)"
local flamingo  = "rgb(eebebe)"
local pink      = "rgb(f4b8e4)"
local mauve     = "rgb(ca9ee6)"
local red       = "rgb(e78284)"
local maroon    = "rgb(ea999c)"
local peach     = "rgb(ef9f76)"
local yellow    = "rgb(e5c890)"
local green     = "rgb(a6d189)"
local teal      = "rgb(81c8be)"
local sky       = "rgb(99d1db)"
local sapphire  = "rgb(85c1dc)"
local blue      = "rgb(8caaee)"
local lavender  = "rgb(babbf1)"
local text      = "rgb(c6d0f5)"
local subtext1  = "rgb(b5bfe2)"
local subtext0  = "rgb(a5adce)"
local overlay2  = "rgb(949cbb)"
local overlay1  = "rgb(838ba7)"
local overlay0  = "rgb(737994)"
local surface2  = "rgb(626880)"
local surface1  = "rgb(51576d)"
local surface0  = "rgb(414559)"
local base      = "rgb(303446)"
local mantle    = "rgb(292c3c)"
local crust     = "rgb(232634)"

hl.config({
    general = {
        col = {
            active_border   = { colors = { rosewater, peach, sky, lavender }, angle = 90 },
            inactive_border = overlay0,
        },
    },
})
