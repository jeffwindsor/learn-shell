function file.check_create(){
# USAGE: FILEPATH
    if ! [ -e "${1}" ]; then
        touch "${1}"
    fi
}
