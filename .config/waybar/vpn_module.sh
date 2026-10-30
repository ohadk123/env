#!/bin/bash

## vpn_module: waybar VPN status for Mullvad, adapted from Shervin S.'s polybar script.
##  Reports [<city> | connecting... | No VPN]. Left-click toggles, right-click opens a
##  rofi location menu (favorites in VPN_LOCATIONS, then every country).

VPN_CONNECT="mullvad connect"
VPN_DISCONNECT="mullvad disconnect"
VPN_RELAY_SET_LOCATION="mullvad relay set location"

VPN_STATUS="$(mullvad status | cut -d' ' -f3)" # Connected/Connecting/<other>
CONNECTED=Connected
CONNECTING=Connecting
DISCONNECTING=Disconnecting

# Favorites, passed as `$VPN_RELAY_SET_LOCATION <input>`.
VPN_LOCATIONS=("us sea" "us chi" "us nyc" "us" "jp" "au" "fr" "br")

icon_connect=
icon_fav=
icon_country=
rofi_location="-location 5 -xoffset -50 -yoffset -50"

# Country codes, taken from `mullvad relay list`.
COUNTRIES=("Albania (al)" "Australia (au)" "Austria (at)" "Belgium (be)" "Brazil (br)" "Bulgaria (bg)" "Canada (ca)" "Czech Republic (cz)" "Denmark (dk)" "Finland (fi)" "France (fr)" "Germany (de)" "Greece (gr)" "Hong Kong (hk)" "Hungary (hu)" "Ireland (ie)" "Israel (il)" "Italy (it)" "Japan (jp)" "Latvia (lv)" "Luxembourg (lu)" "Moldova (md)" "Netherlands (nl)" "New Zealand (nz)" "Norway (no)" "Poland (pl)" "Romania (ro)" "Serbia (rs)" "Singapore (sg)" "Spain (es)" "Sweden (se)" "Switzerland (ch)" "UK (gb)" "United Arab Emirates (ae)" "USA (us)")
COUNTRY_CODES=("al" "au" "at" "be" "br" "bg" "ca" "cz" "dk" "fi" "fr" "de" "gr" "hk" "hu" "ie" "il" "it" "jp" "lv" "lu" "md" "nl" "nz" "no" "pl" "ro" "rs" "sg" "es" "se" "ch" "gb" "ae" "us")


vpn_report() {
    if [ "$VPN_STATUS" = "$CONNECTED" ]; then
        mullvad status | tail -n1 | cut -c29- | awk 'match($0,/[a-zA-Z]+/){printf substr($0,RSTART,RLENGTH)}'
    elif [ "$VPN_STATUS" = "$CONNECTING" ]; then
        echo "Connecting..."
    elif [ "$VPN_STATUS" = "$DISCONNECTING" ]; then
        echo "Disconnecting..."
    else
        echo "No VPN"
    fi
}


vpn_toggle_connection() {
    if [ "$VPN_STATUS" = "$CONNECTED" ]; then
        $VPN_DISCONNECT
    else
        $VPN_CONNECT
    fi
}


vpn_location_menu() {
    hash rofi 2>/dev/null || return

    local codes=("${VPN_LOCATIONS[@]}" "${COUNTRY_CODES[@]}")
    local idx
    idx="$({
        echo " $icon_connect (dis)connect"
        printf " $icon_fav %s\n" "${VPN_LOCATIONS[@]}"
        printf " $icon_country %s\n" "${COUNTRIES[@]}"
    } | rofi -dmenu -i -format i -p "Mullvad VPN" $rofi_location)" || return

    if [ "$idx" -eq 0 ]; then
        vpn_toggle_connection
        return
    fi
    $VPN_RELAY_SET_LOCATION ${codes[idx - 1]}
    [ "$VPN_STATUS" = "$CONNECTED" ] || $VPN_CONNECT
}


ip_address_to_clipboard() {
    ip_address=$(curl --silent https://ipaddr.pub)
    echo "$ip_address" | xclip -selection clipboard
    echo "$ip_address"
}


case "$1" in
    --toggle-connection) vpn_toggle_connection ;;
    --location-menu) vpn_location_menu ;;
    --ip-address) ip_address_to_clipboard;;
    *) vpn_report ;;
esac
