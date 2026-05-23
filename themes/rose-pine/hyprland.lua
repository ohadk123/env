-- name: Rosé Pine Dawn
-- author: jishnurajendran
-- upstream: https://github.com/jishnurajendran/hyprland-rosepine/blob/main/rose-pine-dawn.conf
-- All natural pine, faux fur and a bit of soho vibes for the classy minimalist

local base          = "rgba(faf4edff)"
local surface       = "rgba(fffaf3ff)"
local overlay       = "rgba(f2e9e1ff)"
local muted         = "rgba(9893a5ff)"
local subtle        = "rgba(797593ff)"
local text          = "rgba(575279ff)"
local love          = "rgba(b4637aff)"
local gold          = "rgba(ea9d34ff)"
local rose          = "rgba(d7827eff)"
local pine          = "rgba(286983ff)"
local foam          = "rgba(56949fff)"
local iris          = "rgba(907aa9ff)"
local highlightLow  = "rgba(f4ede8ff)"
local highlightMed  = "rgba(dfdad9ff)"
local highlightHigh = "rgba(cecacdff)"

hl.config({
    general = {
        col = {
            active_border   = { colors = { rose, pine, love, iris }, angle = 90 },
            inactive_border = muted,
        },
    },
})
