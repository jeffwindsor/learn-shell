function command.exists(){
# USAGE: COMMAND STRING
    if type ${1} &> /dev/null; then
        return 0;  #Exists
    else
        return 1;
    fi
}
