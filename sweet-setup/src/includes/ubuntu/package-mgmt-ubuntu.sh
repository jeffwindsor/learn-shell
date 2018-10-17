function add_package(){
  sudo apt-get -y install "$@"
}
function package_update(){
  sudo apt-get update
}