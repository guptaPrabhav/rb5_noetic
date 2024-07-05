# Dockerfile to build image that runs ROS Noetic with Ultrlytics installed.

More stuff will be added as and when required.

To build, run this command while inside the directory conatining the Dockerfile. You can change the name of the image using the ```-t``` tag. You may replace the ```.``` with the directory path to the Dockerfile.
```
sudo docker build -t rb5_noetic .
```

Use the following command to run a new container: 
```
sudo docker run -it --user prabhav --network=host --ipc=host -v /home/prabhav/catkin_ws:/home/prabhav/catkin_ws/ -v /tmp/.X11-unix:/tmp/.X11-unix:rw --env=DISPLAY --gpus all rb5_noetic
```

(Change arguments as required)

To start an existing container. This will start the container with the same settings as when it was first started with and give you an interactive terminal with the -i option:

```
sudo docker container start -i <container_name>
```

Ensure to follow the following guide to install Nvidia Container Toolkit on the host. It allows you to use your GPU within the environment:
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html