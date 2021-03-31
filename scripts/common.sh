log_file=$3

now=$(date) 

RED='\e[0;31m'
GREEN='\e[0;32m'

logger() {
   echo -e $1 >> $log_file
}

installer_logger() {
    if command -v $1 > /dev/null; then
        logger "${GREEN}$now $1 $2 successfully" 
    else
        logger "${RED}$now $1 failed to $2" 
    fi
}

defaultInstall() {
    	local package_name=$2
	local command=${3:-$2}
	if [ $1 == "Arch" ]; then
		sudo pacman --noconfirm -S $package_name 
       		installer_logger $command install
	elif [ $1 == "Debian" ]; then
       		sudo apt install -y $package_name
        	installer_logger $command install
	else
		echo "cant found default installer for $1"
		exit
	fi
}

