log_file=$2

now=$(date) 

RED='\e[0;31m'
GREEN='\e[0;32m'

logger() {
    if command -v $1 > /dev/null; then
        echo -e "${GREEN}$now $1 $2 successfully" >> $log_file
    else
        echo -e "${RED}$now $1 failed to $2" >> $log_file
    fi
}

defaultInstall() {
    	local package_name=$2
	local command=${3:-$2}
	if [ $1 == "Arch" ]; then
       		logger $command install
		pacman --noconfirm -S $package_name 
		exit
	elif [ $1 == "Debian" ]; then
       		apt install -y $package_name
        	logger $command install
		exit
	else
		echo "cant found default installer for $1"
		exit
	fi
}

