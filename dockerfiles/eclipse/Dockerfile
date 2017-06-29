FROM ubuntu:17.04
LABEL maintainer "Prasad Tengse <https://github.com/tprasadtp/minchu>"

ENV DEBIAN_FRONTEND noninteractive
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer libxext-dev libxrender-dev libxtst-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN apt-get update && apt-get install -y libgtk2.0-0 libcanberra-gtk-module

RUN wget http://artfiles.org/eclipse.org//oomph/epp/neon/R3/eclipse-inst-linux64.tar.gz -O /tmp/eclipse.tar.gz -q && \
    echo 'Installing eclipse' && \
    tar -xf /tmp/eclipse.tar.gz -C /opt && \
    rm /tmp/eclipse.tar.gz


RUN cd /usr/local/bin\
    ln -s /opt/eclipse/eclipse  \
    mkdir -p /home/eclipse

ENV HOME /home/eclipse

#Add eclipse user
RUN groupadd -r eclipse && useradd -r -g eclipse -G audio,video eclipse \
   && mkdir -p /home/eclipse/Downloads && chown -R eclipse:eclipse /home/eclipse

USER eclipse
ENV HOME /home/eclipse
WORKDIR /home/eclipse
#CMD /usr/local/bin/eclipse
ENTRYPOINT [ "bash" ]
