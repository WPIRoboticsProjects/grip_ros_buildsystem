# GRIP ROS Buildsystem

This is the build system for generating the ROS Java artifacts and putting them
into the ROS Maven Repository hosted [here](https://github.com/WPIRoboticsProjects/rosjava_mvn_repo).

In order to use this repository, run `./getOrUpdateDependencies.sh` in order to clone
the newest version of the two other repositories that this project depends upon.

This project depends upon the docker image located [here](https://hub.docker.com/r/jlleitschuh/ros-workspace/).
This should be downloaded automatically when the `./docker_lanunch.sh` script is run.


If you would like to build the newest version of the messages then
simply run `./getOrUpdateDependencies.sh` then `./docker_lanunch.sh build`.
When complete, the new artifacts will have ended up inside of the `rosjava_mvn_repo`.
In order to update the maven repository, change directories to `rosjava_mvn_repo` and
run `./update_maven_repo` and follow the prompt.

**NOTE** If you would like to bump the version for the artifact created
you must bump the version in the [grip_msgs] BEFORE building with this repository.
