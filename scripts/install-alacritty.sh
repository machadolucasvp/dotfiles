CURRENT_DIR=$(dirname "$0")
. $CURRENT_DIR/common.sh

WORK_DIR=~/.config/alacritty
mkdir -p $WORK_DIR

defaultInstall alacritty
update-alternatives --config x-terminal-emulator

ln -sf $CURRENT_DIR/../alacritty/alacritty.yml $WORK_DIR/alacritty.yml && logger alacritty configured
