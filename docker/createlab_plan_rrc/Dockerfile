# Build:
#  docker build --rm -f Dockerfile -t gramaziokohler/ros-createlab .
#
# Usage:
#  docker pull gramaziokohler/ros-ros-createlab

FROM gramaziokohler/ros-moveit:20.11
LABEL maintainer "Gonzalo Casas <casas@arch.ethz.ch>"

SHELL ["/bin/bash","-c"]
ENV CATKIN_WS=/root/catkin_ws
RUN mkdir -p $CATKIN_WS/src

COPY . /root/catkin_ws/src

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F42ED6FBAB17C654

# Add robot packages to local catkin workspace
RUN echo "Building catkin workspace" \
    && source /opt/ros/${ROS_DISTRO}/setup.bash \
    # Update apt-get because its cache is always cleared after installs to keep image size down
    && apt-get update && apt-get -y upgrade \
    # Some additional dependencies missing
    && apt-get install ros-${ROS_DISTRO}-robot-state-publisher ros-${ROS_DISTRO}-joint-state-publisher -y \
    # RRC packages
    && git clone https://github.com/compas-rrc/compas_rrc_ros.git \
    # Install dependencies
    && cd $CATKIN_WS \
    && rosdep install -y --from-paths . --ignore-src --rosdistro ${ROS_DISTRO} \
    # Build catkin workspace
    && ROS_LANG_DISABLE=geneus:genlisp:gennodejs catkin_make \
    # Clear apt-cache to reduce image size
    && rm -rf /var/lib/apt/lists/*
