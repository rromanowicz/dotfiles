#!/bin/bash

##################################################################################
############### CONSTANTS ########################################################
##################################################################################
PWD=$(pwd)"/.config"
CONF_DIR=$HOME/.config
SHARE_DIR=.local/share
CONFIGS_LO_LINK=("bashtop" "kitty" "ranger" "polybar" "dunst" "i3")
APPS_TO_INSTALL=("zsh" "neovim" "bashtop" "kitty" "ranger" "polybar" "make" "python" "cargo" "dunst" "lazygit" "rofi" "npm" "unzip" "awesome-terminal-fonts" "xdotool" "ripgrep" "rust-src" "docker" "playerctl", "ncspot")
YAY_INSTALL=("nordvpn-bin" "lazydocker" "bluetui")
PASS=""

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
	SRC=$PWD"/$1/$2"
	[[ -d "$TRGT" ]] && rm -rf $TRGT
	mkdir $TRGT
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/$1.zip
  echo $PASS | sudo unzip $1".zip" -d $TRGT
  rm $1".zip"
}
##################################################################################


##################################################################################
log "SU Password."      ##########################################################
##################################################################################
read -p "Password:" -s PASS
echo ""
if [ -z "$PASS" ]
then
  echo "SU Password is required"
  exit
fi


##################################################################################
log "Checking dependencies."      ################################################
##################################################################################
echo $PASS | sudo pacman -Syu

for i in "${APPS_TO_INSTALL[@]}"
do
x=`pacman -Qi $i | head -n 1`
if [ ! -n "$x" ]; then 
  echo -e "Installing:\n\t$x"
  echo $PASS | sudo pacman -S $i
fi
done


##################################################################################
log "Install yay."      ##########################################################
##################################################################################
read -p "Install yay? (y/n)" yn
case "$yn" in
  [Yy]* ) echo "Downloading installer."
    if [ ! -d "$HOME/git/" ]; then
      echo "Creating ~/git/ directory."
      mkdir ~/git && cd ~/git/
    fi
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
  ;;
  * ) echo "Skipping installation.";;
esac

x=`pacman -Qi yay | head -n 1`
if [ ! -n "$x" ]; then 
  for i in "${YAY_INSTALL[@]}"
  do
    echo -e "Installing:\n\t$i"
    yay -S $i
  done
fi



##################################################################################
log "Fonts."      ################################################################
##################################################################################
read -p "Install NerdFonts? (y/n)" yn
case "$yn" in
  [Yy]* ) echo "Downloading fonts."
  cd $HOME/Downloads/
  get_nerdfont DroidSansMono
  get_nerdfont JetBrainsMono
  get_nerdfont NerdFontsSymbolsOnly
  ;;
  * ) echo "Skipping installation.";;
esac


##################################################################################
log "Creating symlinks."      ####################################################
##################################################################################
for i in "${CONFIGS_LO_LINK[@]}"
do
	echo -e "\tAdding $i configuration."
	create_symlink "$CONF_DIR" "$i"
done


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
log "Copying .zshrc"      ########################################################
##################################################################################
cp $HOME/git/dotfiles/.zshrc $HOME/.zshrc


##################################################################################
log "NvChad"      ################################################################
##################################################################################
read -p "Install NvChad? (y/n)" yn
case "$yn" in
  [Yy]* ) echo "Downloading installer."
  rm -rf $HOME/.config/nvim
  rm -rf $HOME/.local/share/nvim
  git clone https://github.com/rromanowicz/NvChad $CONF_DIR/nvim --depth 1 && nvim
  ;;
  * ) echo "Skipping installation.";;
esac


##################################################################################
log "Setup complete. Have fun."      #############################################
##################################################################################
