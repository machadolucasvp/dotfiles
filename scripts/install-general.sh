#!/bin/bash
USER_HOME=$1
BASED_DISTRO=$2
CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh


defaultInstall $BASED_DISTRO brave
defaultInstall $BASED_DISTRO vscode code

defaultInstall $BASED_DISTRO zsh
chsh -s $(which zsh)
ln -f $CURRENT_DIR/../.zshrc $USER_HOME

echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "installing zsh plugins"
local ZSH_DIR=USER_HOME/.plugins
mkdir $ZSH_DIR
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_DIR
echo "source ${ZSH_DIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

