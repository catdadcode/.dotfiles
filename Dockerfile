FROM ubuntu:22.04

WORKDIR /root

RUN apt-get update &&\
	apt-get install --no-install-recommends -y\
	sudo=1.9.9-1ubuntu2.4\
	unzip=6.0-26ubuntu3.1\
	zsh=5.8.1-1\
	apt-transport-https=2.4.10\
	ca-certificates=20230311ubuntu0.22.04.1 &&\
	apt-get clean &&\
	rm -rf /var/lib/apt/lists/* &&\
	update-ca-certificates

COPY . /root/.dotfiles

WORKDIR /root/.dotfiles

RUN ./install.sh && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

ENV TERM=xterm-256color

CMD ["zsh", "-l"]
