log_file=$1

now=$(date) 

logger() {
    if command -v $1 > /dev/null; then
        echo "$now $1 $2 successfully" >> $log_file
    else
        echo "$now $1 failed to $2" >> $log_file
    fi
}
