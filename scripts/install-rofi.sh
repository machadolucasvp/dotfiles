USER_HOME=$1
BASED_DISTRO=$2
CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh

WORK_DIR=$USER_HOME/.config/rofi
mkdir -p $WORK_DIR

defaultInstall $BASED_DISTRO rofi

ln -f $CURRENT_DIR/../rofi/config.rasi $WORK_DIR/config.rasi && logger "rofi configured"
