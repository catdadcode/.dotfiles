FROM ubuntu:22.04

WORKDIR /root

RUN apt-get install --no-install-recommends git=latest -y && git clone https://github.com/catdadcode/.dotfiles.git

WORKDIR /root/.dotfiles

RUN ./install.sh

ENV TERM=xterm-256color

CMD ["zsh"]
