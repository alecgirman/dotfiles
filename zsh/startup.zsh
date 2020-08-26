# connect to 2410vandyke wifi
function wifi-connect() {
    # 1. Authenticate with network
    wpa_supplicant -i wlp1s0 -c /etc/wpa_supplicant/2410vandyke.conf &

    # wait for wifi to connect before starting the dhcp client daemon
    sleep 3

    # 2. Obtain IP address information from network
    dhcpcd

    sleep 2

    # conduct ping tset to check for successful connection
    echo "Conducting ping test..."
    ping www.google.com &> /dev/null

    if [[ $? -eq 2 ]]
    then
        echo "Failed to connect"
    elif [[ $? -eq 0 ]]
    then
        echo "Connection successful!"
    fi
}

function start-kde() {
    xinit /usr/bin/startplasma-x11 &
    pulseaudio &
}
