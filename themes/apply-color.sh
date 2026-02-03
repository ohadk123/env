#! /usr/bin/env bash

set -xe

cd ~/env/themes
rm -f current
ln -sf "$1" current

hyprctl reload config-only
killall -SIGUSR2 waybar
