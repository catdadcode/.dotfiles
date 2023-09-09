FROM ubuntu:22.04

WORKDIR /root

RUN apt-get update && apt-get install --no-install-recommends sudo unzip zsh apt-transport-https ca-certificates -y && apt-get clean && rm -rf /var/lib/apt/lists/* && update-ca-certificates

COPY . /root/.dotfiles

WORKDIR /root/.dotfiles

RUN ./install.sh && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

ENV TERM=xterm-256color

CMD ["zsh", "-l"]
