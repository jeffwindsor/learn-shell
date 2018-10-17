function install.macos_devtools(){
  add_package_cask iterm2
  add_package_cask google-chrome
  add_package bash
  add_package coreutils
  add_package wget
}
function install.google_chrome(){
  add_package_cask google-chrome
}
function install.bash_git_prompt(){
  add_package bash-git-prompt
  echo "if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
export GIT_PROMPT_ONLY_IN_REPO=1
export GIT_PROMPT_FETCH_REMOTE_STATUS=0" >> ~/.profile
}