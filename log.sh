log() {
    msg=$1
    file=$2

    if ! [ -f "$file" ]; then
	echo "File not exist!"
	sudo touch "$file"
    fi
    
    echo "$msg" | sudo tee -a "$file"

}

log "hahaha" log.log

