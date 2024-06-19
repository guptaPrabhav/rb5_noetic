FROM osrf/ros:noetic-desktop-full

RUN apt-get update && apt-get install -y vim && rm -rf /var/lib/apt/lists/*

COPY config/ /site_config/

ARG USERNAME=prabhav
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && mkdir /home/$USERNAME/.config \
    && chown $USER_UID:$USER_GID /home/$USERNAME/.config

RUN apt-get update \
&& apt-get install -y sudo \
bash-completion \
python3-argcomplete \
python3-pip \
tmux \
&& echo $USERNAME ALL=\(rooot\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
&& chmod 0440 /etc/sudoers.d/$USERNAME \
&& rm -rf /var/lib/apt/lists/*

RUN pip install ultralytics

RUN pip install -U numpy

COPY entrypoint.sh /entrypoint.sh

COPY bashrc /home/${USERNAME}/.bashrc

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]

CMD [ "bash" ]