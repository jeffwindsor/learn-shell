function file.check_add_line(){
# USAGE: TEXT_TO_INSERT,  FILEPATH
    if ! grep -q "${1}" ${2}; then
        eval "echo "${1}" >> "${2}""
    fi
}
