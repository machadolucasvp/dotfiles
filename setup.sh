#!/bin/bash
user_home=$1
temp_folder=scripts/tmp
log_file=$temp_folder/scripts.log

set -e

arch_based_boostrap() {
echo "running arch_based_boostrap"

echo "updating system"
sudo pacman --noconfirm -Syyu

echo "running scripts"
sh ./scripts/install-general.sh $user_home Arch $log_file 
sh ./scripts/install-neovim.sh $user_home Arch $log_file 
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
		mkdir -p $temp_folder
		arch_based_boostrap
		cat $log_file
		rm -r $temp_folder

		exit
	elif [ "$opt" = "Debian" ]; then
		mkdir -p $temp_folder
		debian_based_boostrap
		cat $log_file
		rm -r $temp_folder

		exit
	else
		echo "invalid input"
		exit 
	fi
done

