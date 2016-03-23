#!/bin/sh
docker run --rm -it -v $(pwd)/grip_msgs:/root/catkin_ws/src/grip_msgs -v $(pwd)/gripjava_messages:/root/catkin_ws/src/gripjava_messages -v $(pwd)/rosjava_mvn_repo:/root/rosjava_mvn_repo ros-workspace
