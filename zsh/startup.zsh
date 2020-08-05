function wifi-connect() {
    wpa_supplicant -i wlp1s0 -c /etc/wpa_supplicant/2410vandyke.conf &
    sleep 3
    dhcpcd
}
