#!/bin/bash 

if [ -z $SUDO_USER ]
then
    echo "===== Script need to be executed with sudo ===="
    exit 0
fi

function install_go {
    echo "=======Set up go======"
    sudo apt-get update
    sudo apt-get -y install golang-1.10-go

    mv /usr/lib/go-1.10 /usr/local
    mv /usr/local/go-1.10   /usr/local/go

    # If GOROOT already set then DO Not set it again
    if [ -z $GOROOT ]
    then
        echo "export GOROOT=/usr/local/go" >> ~/.profile
        echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
        echo "export GOPATH=`pwd`/../gopath" >> ~/.profile
        echo "======== Updated .profile with GOROOT/GOPATH/PATH===="

        echo "export GOROOT=/usr/local/go" >> ~/.bashrc
        echo "export GOPATH=`pwd`/../gopath" >> ~/.bashrc
        echo "======== Updated .profile with GOROOT/GOPATH/PATH===="


    else
        echo "======== No Change made to .profile ====="
    fi

    echo "======= Done. PLEASE LOG OUT & LOG Back In ===="
    echo "Then validate by executing    'go version'"

}

function   install_docker {
    
    export DOCKER_VERSION=17

        apt-get update
        apt-get install -y apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
        apt-key fingerprint 0EBFCD88
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        apt-get update

        apt-get install -y "docker-ce"
        docker info

        echo "======= Adding $USER to the docker group ======="
        usermod -aG docker $SUDO_USER
}

# Install Docker
install_docker

# Install Go
install_go

echo "Done. Log out and Log back in."