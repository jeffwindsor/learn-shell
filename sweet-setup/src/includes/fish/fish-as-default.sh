function postinstall.set_fish_shell_as_default(){
  if ! grep -q "/usr/bin/fish" /etc/shells; then
      sudo echo "/usr/bin/fish" >> /etc/shells
  fi
  sudo chsh -s /usr/bin/fish
}