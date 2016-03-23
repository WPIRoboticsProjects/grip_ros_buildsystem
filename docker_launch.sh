#!/bin/sh

# If this is already running then this just works
docker-machine start default
eval "$(docker-machine env default)"

WORKING_DIR=$(pwd)
SRCIPTS_DIR="/root/scripts"
# Volumes to mount into the ros docker enviroment
DOCKER_VOLUMES="-v $WORKING_DIR/grip_msgs:/root/catkin_ws/src/grip_msgs -v $WORKING_DIR/gripjava_messages:/root/catkin_ws/src/gripjava_messages -v $WORKING_DIR/rosjava_mvn_repo:/root/rosjava_mvn_repo -v $WORKING_DIR/docker_scripts:$SRCIPTS_DIR"

# If no argument is passed then just launch the ROS enviroment
if [ $# -eq 0 ]; then
	echo "Running GRIP ROS Docker Container!\n";
	echo "WARNING: Any changes you make here will not be preserved.";
	docker run --rm -it $DOCKER_VOLUMES jlleitschuh/ros-workspace;

elif [ "$1" = "build" ]; then # If using build then run the build script
	echo "Building GRIP Messages";
	CONTAINER_ID=$(docker run -d -it $DOCKER_VOLUMES jlleitschuh/ros-workspace)
	echo "Container ID: $CONTAINER_ID"
	function finish { # Create an exit hook that will run even if something fails.
		echo "Stopping docker container"
		# Sometimes this can fail set a timeout to ensure that it gets killed
		docker stop --time=1 $CONTAINER_ID > /dev/null
		echo "Removing docker container"
		docker rm $CONTAINER_ID > /dev/null
	}
	# Add the finish trap
	trap finish EXIT
	# Exeute the build script to create the
	docker exec -it $CONTAINER_ID .$SRCIPTS_DIR/build_ros_java.sh
else
	echo "Invalid Argument $1. Only 'build' or no argument is supported"
fi
