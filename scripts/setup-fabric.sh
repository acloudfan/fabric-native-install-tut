#!/bin/bash 

# Installs the MINIMAL components to get the environment up
# MUST be executed with sudo

if [ -z $SUDO_USER ]
then
    echo "===== Script need to be executed with sudo ===="
    exit 0
fi

function install_fabric {
    echo "====== Starting to Download Fabric ========"
    curl -sSL http://bit.ly/2ysbOFE -o bootstrap.sh
    ./bootstrap.sh  1.3.0 1.3.0 0.4.10 -s -d

    rm bootstrap.sh

    echo "======= Copying the binaries to /usr/local/bin===="
    cp ./bin/*    /usr/local/bin

    rm -rf config 2> /dev/null
    rm -rf bin
}

install_fabric

echo  "Done. LOGOUT & Log back in"