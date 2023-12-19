#!/bin/bash

#########################################
############### CONSTANTS ###############
#########################################
PWD=$(pwd)"/.config"
CONF_DIR=.config
SHARE_DIR=.local/share
CONFIGS_LO_LINK=("bashtop" "kitty" "ranger" "polybar") # "nvim" "lvim")
APPS_TO_INSTALL=("zsh" "neovim" "bashtop" "kitty" "ranger" "polybar" "make" "python" "cargo")
APPS_TO_COPY=("lvim" "nvim")


#########################################
############### FUNCTIONS ###############
#########################################
function create_symlink {
	TRGT="$HOME/$1/$2"
	SRC=$PWD"/$1/$2"
	[[ -d "$TRGT" ]] && rm -rf $TRGT".old" && mv $TRGT $TRGT".old"
	ln -sf $SRC $TRGT
}

log () {
  echo "-----------------------------"
  echo $1
  echo "-----------------------------"
}
#########################################

#########################################
log "Checking dependencies."
#########################################
sudo pacmay -Syu

#########################################
log "Checking dependencies."
#########################################
for i in "${APPS_TO_INSTALL[@]}"
do
x=`pacman -Qi $i | head -n 1`
if [ ! -n "$x" ]; then 
  echo -e "Installing:\n\t$x"
  sudo pacman -S $i
fi
done


#########################################
log "Checking default shell."
#########################################
if [[ "$SHELL" != *"zsh"* ]]; then
  echo "Setting up zsh."
  chsh -s /bin/zsh

  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
fi


#########################################
log "Checking JDK."
#########################################
if [ ! -d "$HOME/.jdk/" ]; then
  echo "Creating ~/.jdk/ directory."
  mkdir ~/.jdk && cd ~/.jdk/
fi

if [ ! -d "$HOME/.jdk/jdk-19.0.2/" ]; then
echo "Downloading jdk-19.0.2"
  cd ~/.jdk/
  wget https://download.java.net/java/GA/jdk19.0.2/fdb695a9d9064ad6b064dc6df578380c/7/GPL/openjdk-19.0.2_linux-x64_bin.tar.gz
  tar -xzvf openjdk-19.0.2_linux-x64_bin.tar.gz
  rm openjdk-19.0.2_linux-aarch64_bin.tar.gz
fi

if [ ! -d "$HOME/.jdk/jdk-21/" ]; then
echo "Downloading jdk-21"
  cd ~/.jdk/
  wget https://download.java.net/java/GA/jdk21/fd2272bbf8e04c3dbaee13770090416c/35/GPL/openjdk-21_linux-x64_bin.tar.gz
  tar -xzvf openjdk-21_linux-x64_bin.tar.gz
  rm openjdk-21_linux-aarch64_bin.tar.gz
fi


#########################################
log "LunarVim"
#########################################
read -p "Install LunarVim? (y/n)" yn
case "$yn" in
  [Yy]* ) echo "Downloading installer."
  LV_BRANCH='release-1.3/neovim-0.9' 
  bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
  ;;
  * ) echo "Skipping installation.";;
esac

#
#########################################
log "NvChad"
#########################################
read -p "Install NvChad? (y/n)" yn
case "$yn" in
  [Yy]* ) echo "Downloading installer."
  bash <(git clone https://github.com/rromanowicz/NvChad $HOME/.config/nvim --depth 1 && nvim)
  ;;
  * ) echo "Skipping installation.";;
esac


#########################################
log "Creating symlinks."
#########################################
for i in "${CONFIGS_LO_LINK[@]}"
do
	echo -e "\tAdding $i configuration."
	create_symlink "$CONF_DIR" "$i"
done

for i in "${APPS_TO_COPY[@]}"
do
	echo -e "\tCopying $i files."
	create_symlink "$SHARE_DIR" "$i"
done

