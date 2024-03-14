FROM archlinux/archlinux:latest
RUN pacman -Sy && pacman -S --noconfirm wget && wget -O - https://raw.githubusercontent.com/rromanowicz/dotfiles/master/scripts/install_docker.sh | bash

CMD	 ["/bin/bash "]

