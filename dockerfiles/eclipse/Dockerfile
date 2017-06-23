FROM ubuntu:17.04
LABEL maintainer "Prasad Tengse <https://github.com/tprasadtp/minchu>"

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

RUN wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/luna/SR1/eclipse-java-luna-SR1-linux-gtk-x86_64.tar.gz -O /tmp/eclipse.tar.gz -q && \
    echo 'Installing eclipse' && \
    tar -xf /tmp/eclipse.tar.gz -C /opt && \
    rm /tmp/eclipse.tar.gz

ADD run /usr/local/bin/eclipse

RUN chmod +x /usr/local/bin/eclipse && \
    mkdir -p /home/eclipse && \
    echo "eclipse:x:1000:1000:eclipse,,,:/home/eclipse:/bin/bash" >> /etc/passwd && \
    echo "eclipse:x:1000:" >> /etc/group && \
    echo "eclipse ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/eclipse && \
    chmod 0440 /etc/sudoers.d/eclipse && \
    chown eclipse:eclipse -R /home/eclipse && \
    chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

USER eclipse
ENV HOME /home/eclipse
WORKDIR /home/eclipse
CMD /usr/local/bin/eclipse
