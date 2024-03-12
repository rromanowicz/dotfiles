#!/bin/bash

#docker run -it --privileged=true archlinux:latest /bin/bash 
#pacman -Sy && pacman -S --noconfirm wget && wget -O - https://raw.githubusercontent.com/rromanowicz/dotfiles/master/scripts/install_docker.sh | bash

pacman -S --noconfirm git neovim make python cargo lazygit npm unzip awesome-terminal-fonts rust rust-src ripgrep

if [ ! -d "$HOME/.jdk/" ]; then
  echo "Creating ~/.jdk/ directory."
  mkdir ~/.jdk && cd ~/.jdk/
fi

if [ ! -d "$HOME/.jdk/jdk-21/" ]; then
  cd ~/.jdk/
  JDK_21=openjdk-21_linux-x64_bin.tar.gz
  wget https://download.java.net/java/GA/jdk21/fd2272bbf8e04c3dbaee13770090416c/35/GPL/$JDK_21
  tar -xzvf $JDK_21
  rm $JDK_21
fi

git clone https://github.com/rromanowicz/NvChad ~/.config/nvim --depth 1
