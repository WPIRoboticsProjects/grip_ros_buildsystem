#!/bin/bash

echo "Building GRIP ROS Java Artifacts"
# We need to be in the catkin workspace
cd ~/catkin_ws;
# Source the setup
source "devel/setup.bash"
# Export the location we want the dependencies to be placed.
export ROS_MAVEN_DEPLOYMENT_REPOSITORY=~/rosjava_mvn_repo
# Begin the build process
catkin_make


# find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
