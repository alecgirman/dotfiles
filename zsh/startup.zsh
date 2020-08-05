# connect to 2410vandyke wifi
function wifi-connect() {
    # 1. Authenticate with network
    wpa_supplicant -i wlp1s0 -c /etc/wpa_supplicant/2410vandyke.conf &

    # wait for wifi to connect before starting the dhcp client daemon
    sleep 3

    # 2. Obtain IP address information from network
    dhcpcd
}
