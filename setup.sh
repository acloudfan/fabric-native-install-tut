# Installs the MINIMAL components to get the environment up
# MUST be executed with sudo

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

function install_fabric {
    echo "====== Starting to Download Fabric ========"
    # Documentation or Bootstrap script has an issue
    # If -s is placed before the versions (per doc) then you will see a harmless error msg
    curl -sSL http://bit.ly/2ysbOFE | bash -s 1.3.0 1.3.0 0.4.13 -s

    curl -sSL http://bit.ly/2ysbOFE -o bootstrap.sh
    ./bootstrap.sh  1.3.0 1.3.0 0.4.10 -s

    rm bootstrap.sh

    echo "======= Copying the binaries to /usr/local/bin===="
    cp fabric-samples/bin/*    /usr/local/bin

    rm -rf fabric-samples
}

#1
install_docker

#2
install_fabric

echo  "Done. LOGOUT & Log back in"