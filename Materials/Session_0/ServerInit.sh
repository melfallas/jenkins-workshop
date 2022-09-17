#!/bin/bash
#sed -i -e 's/\r$//' scriptname.sh

# Creación de usuario Admin
CURRENT_USER=$(whoami)
DEFAULT_USER=sysadmin
# Set password con adduser comand
sudo adduser "${DEFAULT_USER}"
sudo usermod -aG sudo "${DEFAULT_USER}"
sudo usermod -aG sudo "${CURRENT_USER}"

# Configurar Fecha
timedatectl
sudo timedatectl list-timezones | grep "Costa_Rica"
sudo timedatectl set-timezone "America/Costa_Rica"
timedatectl


