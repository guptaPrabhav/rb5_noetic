# Dockerfile to build image that runs ROS Noetic with Ultrlytics installed.

More stuff will be added as and when required.

use the following command to run: 
```
sudo docker run -it --user prabhav --network=host --ipc=host -v /home/prabhav/catkin_ws:/home/prabhav/catkin_ws/ -v /tmp/.X11-unix:/tmp/.X11-unix:rw --env=DISPLAY --gpus all rb5_noetic
```

(Change arguments as required)

Ensure to follow the following guide to install Nvidia Container Toolkit on the host. It allows you to use your GPU within the environment:
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html