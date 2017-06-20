# Base docker image
FROM ubuntu:17.04
LABEL maintainer "Prasad Tengse <https://github.com/tprasadtp/minchu>"


ARG container-user=setup-script
ENV HOME /home/setup-script

# Install

RUN apt-get update
RUN apt-get update && apt-get install -y \
	ubuntu-gnome-desktop

ENV HOME /home/setup-script
RUN useradd --create-home --home-dir $HOME setup-script \
	&& gpasswd -a setup-script audio \
	&& chown -R setup-script:setup-script $HOME

RUN sudo adduser setup-script sudo
ENV HOME /home/setup-script

# Run as non privileged user
USER setup-script
WORKDIR $HOME
ADD ~/.bashrc ~/.bashrc
# Autorun
ENTRYPOINT [ "/bin/bash" ]
