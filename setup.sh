#!/bin/bash
temp_folder=scripts/tmp
log_file=$temp_folder/scripts.log

set -e

if [ "$EUID" -ne 0 ]; then 
    echo "Please run as super user"
    exit
fi

mkdir -p $temp_folder

apt update -y
apt install -y build-essential

sh ./scripts/install-neovim.sh $log_file
sh ./scripts/install-tmux.sh $log_file
sh ./scripts/install-rofi.sh $log_file
sh ./scripts/install-alacritty.sh $log_file
sh ./scripts/install-general.sh $log_file

cat $log_file

