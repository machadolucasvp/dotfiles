#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as super user"
  exit
fi

mkdir -p scripts/tmp

sh ./scripts/install-neovim.sh


cat scripts/tmp/script.log
rm -r scripts/tmp
