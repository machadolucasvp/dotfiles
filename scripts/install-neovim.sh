CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh

WORK_DIR=~/.config/nvim
mkdir -p $WORK_DIR

if ! type vim > /dev/null; then
    apt install -y neovim
    logger nvim installed
fi

ln -sf $CURRENT_DIR/../nvim/init.vim $WORK_DIR/init.vim && logger nvim configured 

