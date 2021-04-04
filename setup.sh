#!/bin/bash
USER_HOME==$1
TEMP_FOLDER=scripts/tmp
LOG_FILE=$TEMP_FOLDER/scripts.log

set -e

arch_based_boostrap() {
echo "running arch_based_boostrap"

echo "updating system"
sudo pacman --noconfirm -Syyu

echo "running scripts"
sh ./scripts/install-general.sh $USER_HOME Arch $LOG_FILE 

echo "linking i3 configs"
mkdir -p ~/.i3
ln -f $CURRENT_DIR/../i3/config ~/.i3/config

echo "linking conky configs"
sudo ln -f $CURRENT_DIR/../conky/conky_gruvbox /usr/share/conky/
sudo ln -f $CURRENT_DIR/../conky/conky1.10_shortcuts_gruvbox /usr/share/conky/
sudo ln -f $CURRENT_DIR/../conky/start_conky_gruvbox /bin/

sh ./scripts/install-neovim.sh $USER_HOME Arch $LOG_FILE
sh ./scripts/install-alacritty.sh $USER_HOME Arch $LOG_FILE
sh ./scripts/install-rofi.sh $USER_HOME Arch $LOG_FILE
sh ./scripts/install-tmux.sh $USER_HOME Arch $LOG_FILE
}

debian_based_boostrap() {
echo "running debian_based_boostrap"

#sudo apt update -y
#sudo apt install -y build-essential

#sh ./scripts/install-neovim.sh $log_file
#sh ./scripts/install-tmux.sh $log_file
#sh ./scripts/install-rofi.sh $log_file
#sh ./scripts/install-alacritty.sh $log_file
#sh ./scripts/install-general.sh $log_file
}

# setup menu
OPTIONS="Arch Debian Quit"

echo "which distro is your OS based ?"
select opt in $OPTIONS; do
	if [ "$opt" = "Quit" ]; then
		exit 
	elif [ "$opt" = "Arch" ]; then
		mkdir -p $TEMP_FOLDER
		arch_based_boostrap
		cat $LOG_FILE
		rm -r $TEMP_FOLDER

		exit
	elif [ "$opt" = "Debian" ]; then
		mkdir -p $TEMP_FOLDER
		debian_based_boostrap
		cat $LOG_FILE
		rm -r $TEMP_FOLDER

		exit
	else
		echo "invalid input"
		exit 
	fi
done

