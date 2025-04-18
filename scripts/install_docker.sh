#!/bin/bash

#docker build --no-cache --tag 'devenv:latest' .
#docker run --name "devenv" -it devenv /bin/zsh


pacman -S --noconfirm git zsh neovim make python cargo lazygit npm unzip awesome-terminal-fonts rust rust-src rust-analyzer ripgrep pkg-config openssh yazi debugedit fakeroot


echo "Setting up zsh."
chsh -s /bin/zsh
chsh -s /usr/bin/zsh

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
git clone https://github.com/rromanowicz/nvim ~/.config/nvim


echo "alias vim='nvim'" >> $HOME/.zshrc
echo "alias lg='lazygit'" >> $HOME/.zshrc
echo "export JAVA_HOME=~/.jdk/jdk-21" >> $HOME/.zshrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> $HOME/.zshrc


sh -c "$(wget -O- https://raw.githubusercontent.com/greyltc-org/docker-archlinux-aur/refs/heads/master/add-aur.sh)"
aur-install posting
