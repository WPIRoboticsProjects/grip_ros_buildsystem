#!/bin/sh

git submodule update --remote

if [ -d rosjava_mvn_repo ] # If the directory already exists
then ( cd rosjava_mvn_repo && git pull ) # Make sure that its up to date
else # We have to download the repo
git clone https://github.com/WPIRoboticsProjects/rosjava_mvn_repo.git
fi

if [ -d grip_msgs ] # If the directory already exists
then ( cd grip_msgs && git pull ) # Make sure that its up to date
else # We have to download the repo
git clone https://github.com/WPIRoboticsProjects/grip_msgs.git
fi
