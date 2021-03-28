USER_HOME=$1
BASED_DISTRO=$2
CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh

WORK_DIR=$USER_HOME/.config/nvim
mkdir -p $WORK_DIR


defaultInstall $BASED_DISTRO neovim nvim

#vim-plug
echo ""${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo ln -f $CURRENT_DIR/../nvim/init.vim $WORK_DIR/init.vim && logger "nvim configured" 

