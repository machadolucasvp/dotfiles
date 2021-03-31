USER_HOME=$1
BASED_DISTRO=$2
CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh

WORK_DIR=$USER_HOME/.config/alacritty
mkdir -p $WORK_DIR

defaultInstall $BASED_DISTRO alacritty

ln -f $CURRENT_DIR/../alacritty/alacritty.yml $WORK_DIR/alacritty.yml && logger "alacritty configured"

