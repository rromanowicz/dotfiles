#!/bin/bash

#docker run -it --privileged=true archlinux:latest /bin/bash 
#pacman -Sy && pacman -S --noconfirm wget && wget -O - https://raw.githubusercontent.com/rromanowicz/dotfiles/master/scripts/install_docker.sh | bash

pacman -S --noconfirm git zsh neovim make python cargo lazygit npm unzip awesome-terminal-fonts rust rust-src ripgrep 


echo "Setting up zsh."
chsh -s /bin/zsh

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z


echo "Setting up JDK."
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

echo "Cloning nvim config."
git clone https://github.com/rromanowicz/NvChad ~/.config/nvim --depth 1


echo "Setting up ZSH."
echo "alias vim='nvim'" >> $HOME/.zshrc
echo "alias lg='lazygit'" >> $HOME/.zshrc
