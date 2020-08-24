CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh

WORK_DIR=~/.config/rofi
mkdir -p $WORK_DIR

defaultInstall rofi

ln -sf $CURRENT_DIR/../rofi/config.rasi $WORK_DIR/config.rasi && logger rofi configured
