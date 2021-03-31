USER_HOME=$1
BASED_DISTRO=$2
CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh

WORK_DIR=$USER_HOME/.config/tmux
mkdir -p $WORK_DIR

defaultInstall $BASED_DISTRO tmux

ln -f $CURRENT_DIR/../tmux/tmux.conf $WORK_DIR/tmux.conf && ln -f $CURRENT_DIR/../tmux/tmux-colorscheme.conf $WORK_DIR/tmux-colorscheme.conf && logger "tmux configured"
