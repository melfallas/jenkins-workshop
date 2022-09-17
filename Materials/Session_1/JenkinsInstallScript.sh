#!/bin/bash
#sed -i -e 's/\r$//' scriptname.sh

#USERNAME=sysadmin
USERNAME=$(whoami)
# Declaring script constants
IMAGE_NAME=jenkins/docker
JENKINS_DOKERFILE=JenkinsInstallDockerfile
COMPOSE_FILE=docker-compose-jenkins-docker.yml

#------------------- Create jenkins installation folder -------------------#
cd 
echo ""
echo "Current User: $USERNAME"
echo ""
echo "*********************************"
echo "***  Creating Jenkins Folder  ***"
echo "*********************************"
echo ""
mkdir -p jenkins
#--------------- Moving jenkins installation docker files -----------------#
if [ -f $JENKINS_DOKERFILE ]; then
   mv $JENKINS_DOKERFILE jenkins/
fi
if [ -f $COMPOSE_FILE ]; then
   mv $COMPOSE_FILE jenkins/
fi
cd jenkins
echo "Current Directory: $PWD"
echo ""
echo "Listing directory file list:"
echo "------------------------------------------------------------"
ls
echo "------------------------------------------------------------"
echo ""
echo "********************************"
echo "***  Creating Jenkins Image  ***"
echo "********************************"
echo ""
echo "Executing Dockerfile for jenkins/docker image creation"
echo ""
docker-compose -f $COMPOSE_FILE build
echo ""
echo "*********************************"
echo "***  Starting Jenkins Server  ***"
echo "*********************************"
echo ""
echo "Running Jenkins container with docker-compose"
echo ""
mkdir -p $PWD/jenkins_home
sudo chown -R $USERNAME:$USERNAME $PWD/jenkins_home
docker-compose -f docker-compose-jenkins-docker.yml up -d
echo ""
