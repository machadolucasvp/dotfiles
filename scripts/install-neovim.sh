. ./common.sh

WORK_DIR=~/.config/nvim
mkdir -p $WORK_DIR

if ! type vim > /dev/null; then
    apt install -y neovim
    logger nvim installed
fi

ln -sf ../nvim/init.vim $WORK_DIR/init.vim && logger nvim configured 

