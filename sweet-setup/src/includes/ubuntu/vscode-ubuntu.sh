function install.visual_studio_code(){
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

  add_package apt-transport-https
  package_update
  add_package code # or code-insiders

  # add extension
  for ext in "${vscode_exts[@]}"; do
    add_vscode_ext $ext
  done
}