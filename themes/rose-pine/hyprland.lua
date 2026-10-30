-- name: Rosé Pine
-- upstream: https://github.com/rose-pine/hyprland
-- All natural pine, faux fur and a bit of soho vibes for the classy minimalist

local base          = "rgba(191724ff)"
local surface       = "rgba(1f1d2eff)"
local overlay       = "rgba(26233aff)"
local muted         = "rgba(6e6a86ff)"
local subtle        = "rgba(908caaff)"
local text          = "rgba(e0def4ff)"
local love          = "rgba(eb6f92ff)"
local gold          = "rgba(f6c177ff)"
local rose          = "rgba(ebbcbaff)"
local pine          = "rgba(31748fff)"
local foam          = "rgba(9ccfd8ff)"
local iris          = "rgba(c4a7e7ff)"
local highlightLow  = "rgba(21202eff)"
local highlightMed  = "rgba(403d52ff)"
local highlightHigh = "rgba(524f67ff)"

hl.config({
    general = {
        col = {
            active_border   = { colors = { rose, pine, love, iris }, angle = 90 },
            inactive_border = muted,
        },
    },
})
