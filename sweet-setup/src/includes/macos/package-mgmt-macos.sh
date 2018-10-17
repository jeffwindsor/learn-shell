function add_package(){
  brew install "$@"
}
function package_update(){
  brew update;
  brew upgrade;
  brew prune;
  brew cleanup;
  brew doctor;
}
function add_package_cask(){
  brew cask install "$@"
}
function preinstall.homebrew(){
  if command_exists brew; then
      echo -e "==>\e[38;5;39m Homebrew already installed... updating \e[0m"
      package_update;
  else
      echo -e "==>\e[38;5;39m Adding Homebrew \e[0m"
      # https://brew.sh/
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
  fi
  ###############################################################################
  echo -e "==>\e[38;5;39m Adding Cask Support \e[0m"
  # https://caskroom.github.io/
  brew cask caskroom/cask
  brew cask caskroom/versions
}