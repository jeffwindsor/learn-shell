function add_package(){
  sudo pacman -S --noconfirm "$@"
}
function add_package_aur(){
  #sudo not advised
  yay -S --noconfirm "$@"
}
function preinstall.aur_support(){
  add_package base-devel yay
  yay --no-confirm
}
function package_update(){
  # ??? yay
  # ??? packaman
}