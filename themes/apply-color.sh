#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"
themes=$(ls -d */ | tr -d / | grep -vx current)
active=$(readlink current || true)
# no argument: pick from a rofi menu, active theme first
menu=$( { [ -n "$active" ] && echo "$active"; grep -vx "$active" <<< "$themes"; } || true)
theme=$(basename "${1:-$(rofi -dmenu -i -p Theme <<< "$menu" || true)}")
[ -n "$theme" ] && [ "$theme" != current ] && [ -d "$theme" ] ||
    { echo "usage: $0 [$(paste -sd'|' <<< "$themes")]" >&2; exit 1; }

ln -sfn "$theme" current
hyprctl reload config-only
pkill -USR2 waybar || true
pkill -USR1 kitty || true
makoctl reload || true
pkill -USR1 nvim || true
pkill -USR1 cava || true
pkill -USR2 btop || true
