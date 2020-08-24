CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh

WORK_DIR=~/.config/nvim
mkdir -p $WORK_DIR

defaultInstall vim neovim
update-alternatives --config editor

ln -sf $CURRENT_DIR/../nvim/init.vim $WORK_DIR/init.vim && logger nvim configured 

