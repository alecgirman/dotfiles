# connect to 2410vandyke wifi
function wifi-connect() {
    # 1. Authenticate with network
    wpa_supplicant -i wlp5s0 -c /etc/wpa_supplicant/wifi.conf &

    # wait for wifi to connect before starting the dhcp client daemon
    sleep 3

    # 2. Obtain IP address information from network
    dhcpcd

    sleep 2
}

function start-kde() {
    xinit /usr/bin/startplasma-x11 &
    pulseaudio &
}
