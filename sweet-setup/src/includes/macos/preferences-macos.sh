function install.clipy_clipboard_app(){
  #https://github.com/Clipy/Clipy
  add_package_cask clipy
}

function postinstall.set_macos_preferences(){
  # ? fill this in

  shell_aliases+=( "brewup::brew update\n  brew upgrade\n  brew prune\n  brew cleanup\n  brew doctor" )
}