#!/bin/bash

# curl -s https://raw.githubusercontent.com/rromanowicz/dotfiles/refs/heads/master/testinstall.sh | sh

##################################################################################
############### FUNCTIONS ########################################################
##################################################################################
log () {
  echo "-----------------------------"
  echo $1
  echo "-----------------------------"
}

function create_symlink {
	TRGT="$1/$2"
	SRC="$PWD/$2"
	[[ -d "$TRGT" ]] && rm -rf $TRGT".old" && mv $TRGT $TRGT".old"
	ln -sf $SRC $TRGT
}

function get_nerdfont {
  log "Installing font: $1" 
    TRGT="/usr/share/fonts/$1"
    [[ -d "$TRGT" ]] && rm -rf $TRGT
    mkdir $TRGT
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/$1.zip
  sudo unzip $1".zip" -d $TRGT
  rm $1".zip"
}
##################################################################################


log "Installing packages."
sudo pacman -Sy
sudo pacman -noconfirm -S git zsh neovim bashtop kitty make go python cargo dunst lazygit rofi npm unzip awesome-terminal-fonts xdotool ripgrep rust-src docker playerctl yazi xsel fzf bluetoothctl


log "Cloning dotfiles."
git clone https://github.com/rromanowicz/dotfiles ~/git/dotfiles


DOTFILES_DIR=~/git/dotfiles/
DOTFILES_CONFIG_DIR=$DOTFILES_DIR\.config/
CONFIG_DIR=~/.config/

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

if [ ! -d ~/git ]; then
    mkdir ~/git
fi


##################################################################################
log "Creating config links."      ################################################
##################################################################################
for dir in $DOTFILES_CONFIG_DIR*/
do
    dir=${dir%*/}      # remove the trailing "/"
    dirname="${dir##*/}"    # print everything after the final "/"
    echo "ln -s $DOTFILES_CONFIG_DIR$dirname $CONFIG_DIR$dirname"
done
    echo "ln -s $DOTFILES_DIR\.zshrc ~/\.zshrc"
##################################################################################


##################################################################################
log "Fonts."      ################################################################
##################################################################################
cd $HOME/Downloads/
get_nerdfont DroidSansMono
get_nerdfont JetBrainsMono
get_nerdfont NerdFontsSymbolsOnly
##################################################################################


##################################################################################
log "Checking JDK."      #########################################################
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
##################################################################################


##################################################################################
log "Checking default shell."      ###############################################
##################################################################################
if [[ "$SHELL" != *"zsh"* ]]; then
  echo "Setting up zsh."
  chsh -s /bin/zsh

  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
fi
##################################################################################
