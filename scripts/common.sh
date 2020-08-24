log_file=$1

now=$(date) 

logger() {
    if command -v $1 > /dev/null; then
        echo "$now $1 $2 successfully" >> $log_file
    else
        echo "$now $1 failed to $2" >> $log_file
    fi
}

defaultInstall() {
    local package_name=${2:-$1}

    if ! type $1 > /dev/null; then
        apt install -y $package_name
        logger $package_name installed
    fi
}

