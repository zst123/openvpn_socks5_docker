FROM debian:sid

RUN apt-get update && \
    apt-get install -y \
    openvpn \
    net-tools \
    dante-server \
    procps \
    sudo \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN echo 'set completion-ignore-case on' >> ~/.inputrc && \
    echo "export LS_OPTIONS='--color=auto'" >> ~/.bashrc && \
    echo "alias ls='ls $LS_OPTIONS'" >> ~/.bashrc && \
    echo ". ~/.bash_theme" >> ~/.bashrc && \
    echo 'launch () { openvpn --config "$1" --daemon; sleep 3; danted -D; echo "Started $1"; }' >> ~/.bashrc && \
    echo "halt () { killall openvpn; killall danted; echo 'Stopped'; }" >> ~/.bashrc && \
    echo "Done"

COPY ./theme /root/.bash_theme
