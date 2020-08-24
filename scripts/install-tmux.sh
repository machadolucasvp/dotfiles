CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh

WORK_DIR=~/.config/tmux
mkdir -p $WORK_DIR

defaultInstall tmux

ln -sf $CURRENT_DIR/../tmux/tmux.conf $WORK_DIR/tmux.conf && logger tmux configured
