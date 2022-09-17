#!/bin/bash
#sed -i -e 's/\r$//' scriptname.sh

#USERNAME=sysadmin
CURRENT_USER=$(whoami)

echo ""
echo "Current User: $CURRENT_USER"
echo ""

#------------------- Configuración de de Docker CE -------------------#
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
# Use a repository over HTTPS
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Verify that you now have the key with the fingerprint
sudo apt-key fingerprint 0EBFCD88
# Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# Instalación de Docker CE
sudo apt-get -y install docker-ce
sudo usermod -aG docker "${CURRENT_USER}"
sudo chown $CURRENT_USER:$CURRENT_USER /var/run/docker.sock
#sudo gpasswd -a $CURRENT_USER docker
#sudo setfacl -m user:$CURRENT_USER:rw /var/run/docker.sock
#sudo systemctl enable docker

# Remover Docker CE
#sudo apt-get purge docker-ce
#sudo rm -rf /var/lib/docker

# Instalación de Docker CE Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

