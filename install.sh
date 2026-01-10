#!/bin/bash
set -e

# curl -s https://raw.githubusercontent.com/rromanowicz/dotfiles/refs/heads/master/testinstall.sh | sh

##################################################################################
############### FUNCTIONS ########################################################
##################################################################################
log () {
  echo "-----------------------------"
  echo $1
  echo "-----------------------------"
}

function get_nerdfont {
  log "Installing font: $1" 
  TRGT="/usr/share/fonts/$1"
  if [ ! -d $TRGT ]; then
    mkdir $TRGT
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/$1.zip
    unzip $1".zip" -d $TRGT
    rm $1".zip"
  fi
}
##################################################################################


DOTFILES_DIR=~/git/dotfiles/
DOTFILES_CONFIG_DIR=$DOTFILES_DIR\.config/
CONFIG_DIR=~/.config/


##################################################################################
log "Packages"      ##############################################################
##################################################################################
pacman -Sy
pacman --noconfirm -S git wget zsh neovim bashtop kitty make go python cargo rust-analyzer lazygit npm unzip awesome-terminal-fonts xdotool ripgrep rust-src docker playerctl yazi xsel fzf


if [ ! -d $CONFIG_DIR ]; then
    mkdir $CONFIG_DIR
fi

if [ ! -d ~/git ]; then
    mkdir ~/git
fi

if [ ! -d ~/Downloads ]; then
    mkdir ~/Downloads
fi

if [ ! -d $DOTFILES_DIR ]; then
  log "Cloning dotfiles."
  git clone https://github.com/rromanowicz/dotfiles ~/git/dotfiles
fi
##################################################################################


##################################################################################
log "Symlinks"      ##############################################################
##################################################################################
for dir in $DOTFILES_CONFIG_DIR*/
do
    dir=${dir%*/}
    dirname="${dir##*/}"
    ln -sf $DOTFILES_CONFIG_DIR$dirname $CONFIG_DIR$dirname
done
##################################################################################


##################################################################################
log "Fonts"      #################################################################
##################################################################################
cd $HOME/Downloads/
get_nerdfont DroidSansMono
get_nerdfont JetBrainsMono
get_nerdfont NerdFontsSymbolsOnly
cd ~
##################################################################################


##################################################################################
log "JDK"      ###################################################################
##################################################################################
if [ ! -d "$HOME/.jdk/" ]; then
  echo "Creating ~/.jdk/ directory."
  mkdir ~/.jdk && cd ~/.jdk/
fi

if [ ! -d "$HOME/.jdk/jdk-19.0.2/" ]; then
  echo "Downloading jdk-19.0.2"
  cd ~/.jdk/
  JDK_19=openjdk-19.0.2_linux-x64_bin.tar.gz
  wget https://download.java.net/java/GA/jdk19.0.2/fdb695a9d9064ad6b064dc6df578380c/7/GPL/$JDK_19
  tar -xzvf $JDK_19
  rm $JDK_19
fi

if [ ! -d "$HOME/.jdk/jdk-21/" ]; then
  echo "Downloading jdk-21"
  cd ~/.jdk/
  JDK_21=openjdk-21_linux-x64_bin.tar.gz
  wget https://download.java.net/java/GA/jdk21/fd2272bbf8e04c3dbaee13770090416c/35/GPL/$JDK_21
  tar -xzvf $JDK_21
  rm $JDK_21
fi
cd ~
##################################################################################


##################################################################################
log "ZSH"      ###############################################
##################################################################################
if [[ "$SHELL" != *"zsh"* ]]; then
  echo "Setting up zsh."

  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

  rm ~/\.zshrc
  ln -sf $DOTFILES_DIR\.zshrc ~/\.zshrc
  chsh -s /bin/zsh
fi
##################################################################################
