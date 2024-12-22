# Use the NVIDIA L4T base image
FROM nvcr.io/nvidia/l4t-base:r36.4

# Set environment variables
ENV DEBIAN_FRONTEND=interactive

# Install ros stuff
RUN apt-get update && apt-get install -y \
    apt install software-properties-common \
    add-apt-repository universe \
    apt update \
    apt install curl -y \
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - \
    echo "deb http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2-latest.list \
    apt update \
    apt install ros-humble-desktop \
    echo "source /opt/ros/<ros-distro>/setup.bash" >> ~/.bashrc \
    source ~/.bashrc \
    sudo apt install python3-colcon-common-extensions

#realsense camera install stuff 
RUN sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade \
    sudo apt-get install libssl-dev libusb-1.0-0-dev libudev-dev pkg-config libgtk-3-dev \
    sudo apt-get install git wget cmake build-essential \
    sudo apt-get install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev at \
    #dependencies
    git clone https://github.com/IntelRealSense/librealsense.git \
    ./scripts/setup_udev_rules.sh \
    ./scripts/patch-realsense-ubuntu-lts-hwe.sh \
    #building realsense2 sdk
    mkdir build && cd build \
    cmake ../ -DBUILD_EXAMPLES=true \
    #install ros2 humble (realsense stuff)
    sudo apt install ros-humble-realsense2-*

#Setting up Pixhawk-Jetson connection
RUN sudo apt remove brltty \
    apt-get install ros-humble-mavros ros-humble-mavros-extras \ 
    wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh \  
    ./install_geographiclib_datasets.sh \ 
    #figure out writing file?
    echo '<launch> <arg name="fcu_url" default="/dev/ttyACM0:115200" /> <arg name="gcs_url" default="" /> <arg name="tgt_system" default="1" /> <arg name="tgt_component" default="1" /> <arg name="log_output" default="screen" /> <arg name="fcu_protocol" default="v2.0" /> <arg name="respawn_mavros" default="false" /> <arg name="namespace" default="mavros"/> <include file="$(find-pkg-share mavros)/launch/node.launch"> <arg name="pluginlists_yaml" value="$(find-pkg-share mavros)/launch/apm_pluginlists.yaml" /> <arg name="config_yaml" value="$(find-pkg-share mavros)/launch/apm_config.yaml" /> <arg name="fcu_url" value="$(var fcu_url)" /> <arg name="gcs_url" value="$(var gcs_url)" /> <arg name="tgt_system" value="$(var tgt_system)" /> <arg name="tgt_component" value="$(var tgt_component)" /> <arg name="fcu_protocol" value="$(var fcu_protocol)" /> <arg name="respawn_mavros" value="$(var respawn_mavros)" /> <arg name="namespace" value="$(var namespace)"/> </include> </launch>' > /opt/ros/humble/share/mavros/launch/apm.launch

# Copy application files into the container (if applicable)
#COPY app /app

# Set working directory
#WORKDIR /app

# Run the application
#CMD ["python3", "main.py"]

