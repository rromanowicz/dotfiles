FROM archlinux/archlinux:latest

# COPY install_docker.sh install.sh
# RUN pacman -Sy && pacman -S --noconfirm wget && sh install.sh

RUN pacman -Sy && pacman -S --noconfirm wget && wget -O - https://raw.githubusercontent.com/rromanowicz/dotfiles/master/scripts/install_docker.sh | bash

CMD	 ["/bin/bash "]

