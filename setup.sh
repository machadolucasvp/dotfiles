#!/bin/bash
temp_folder=scripts/tmp
log_file=$temp_folder/scripts.log

set -e

if [ "$EUID" -ne 0 ]; then 
    echo "Please run as super user"
    exit
fi

arch_based_boostrap() {
echo "running arch_based_boostrap"
}

debian_based_boostrap() {
echo "running debian_based_boostrap"

#apt update -y
#apt install -y build-essential

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

		exit
	elif [ "$opt" = "Debian" ]; then
		mkdir -p $temp_folder
		debian_based_boostrap
		cat $log_file

		exit
	else
		echo "invalid input"
		exit 
	fi
done

