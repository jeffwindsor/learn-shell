#!/bin/bash
###############################################################################
## single line command for execution:  wget -O - <RAW_URL> | bash
##
## PACKAGES - SYNCED FROM http://gitlab.cj.com/cjdev/onboarding/blob/master/machine-setup.md
###############################################################################
CASKS=(
  java8
  tcl #(for gitk to look better in HiDPI mode (e.g., Retina display))
  iterm2
  firefox
  google-chrome
  intellij-idea
  virtualbox
  teamviewer
  dbvisualizer
)
## 1=Display Name of App for prompt,  #2=package name
CASKS_OPTIONAL=(
  visual-studio-code
  atom
  slack
)
PACKAGES=(
  scala
  bash #(unless you want to use a 10-year-old version of Bash)
  coreutils #(gives you the latest version of GNU CoreUtils)
  gti
  maven
  node
  mongodb
  cassandra #(we need a version of cqlsh that supports cqlversion 3.1.7, so you might not be able to install this via brew)
  tree
  gnupg@2.0 #(This is needed for file encyption tests in b2b)
  selenium-server-standalone
  phantomjs
  wget
  haskell-stack
  graphviz
  openssl
  python@2
  awscli
  watch
  bash-completion
)
## 1=Display Name of App for prompt,  #2=package name
PACKAGES_OPTIONAL=(
  "vim --with-override-system-vi"
  macvim
)
###############################################################################
## HELPER FUNCTIONS
## INLINED FROM PRETTY-PRINT.SH ###############################################
to_eol() { printf "${1}$(seq -s "${2}" $((${#1} + 1)) $(tput cols) | tr -d '[:digit:]')"; }
section(){ printf "\e[48;5;27m$(to_eol "" '¯')\n$(to_eol "${1}" ' ')\n$(to_eol "" '_')\e[0m"; echo;}
info()   { echo -e "$(bg 28)$(fg 255)$(fill "${1}" " ")$(eof)";  }
warning(){ echo -e "$(bg 208)$(fg 0)$(fill "${1}" " ")$(eof)";  }
error()  { echo -e "$(bg 196)$(fg 255)$(fill "${1}" " ")$(eof)";  }
detail() { echo -e "$(fg 250)$(fill "${1}" " ")$(eof)";  }
## INLINED FROM https://djm.me/ask ###############################################
ask(){
    local prompt default reply

    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read reply </dev/tty

        # Default?
        if [ -z "$reply" ]; then
            reply=$default
        fi

        # Check if the reply is valid
        case "$reply" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}
###############################################################################
## PROMPT FOR OPTIONALS
for i in "${PACKAGES_OPTIONAL[@]}"; do
  if ask "Install ${i}?"; then
    PACKAGES+=("$i")
  fi
done
for i in "${CASKS_OPTIONAL[@]}"; do
  if ask "Install ${i}?"; then
    CASKS+=("$i")
  fi
done

###############################################################################
section "Installation"
# https://brew.sh/
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
# https://caskroom.github.io/
brew tap caskroom/cask
brew tap caskroom/versions
# PACKAGES
for i in "${PACKAGES[@]}"; do
  info "Brewing $i"
  exec "$(brew install ${i})"
done
# CASKS
for i in "${CASKS[@]}"; do
  info "Tapping $i"
  exec "$(brew cask install ${i})"
done

###############################################################################
section "Configuration"

## ADD ~/.bash_profile if it does not exist
if ! [ -e ~/.bash_profile ]; then
  info "Adding ~/.bash_profile"
  touch ~/.bash_profile
fi

##  ADD "source ~/.profile" to bash_profile if it doesn not exist
if ! grep -q "source ~/.profile" ~/.bash_profile; then
    info "Sourcing .profile in .bash_profile"
    echo -e "\nsource ~/.profile" >>  ~/.bash_profile
fi

## ADD ~/.profile if it does not exist
if ! [ -e ~/.profile ]; then
  info "Adding ~/.profile"
  touch ~/.profile
fi

#Add a symlink to gpg: Run
info "Adding a symlink to gpg for Run"
sudo ln -s /usr/local/opt/gnupg@2.0/bin/gpg /usr/local/bin/gpg

#Haskell Prompt
info "Haskell prompt set tp Grey imports, Red and Grey haskel symbol"
echo ":set prompt \"\ESC[38;5;242m\STX%s\n\ESC[38;5;161m❯\ESC[1;34mλ= \ESC[0m"\" > ~/.ghci

#Bash Completion
echo "\nif [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi" >> ~/.profile

#Bash Git Prompt
echo "\nif [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
export GIT_PROMPT_ONLY_IN_REPO=1
export GIT_PROMPT_FETCH_REMOTE_STATUS=0" >> /.profile

#
info Checkout and setup git Software folder
git clone git@gitlab.cj.com:cjdev/software.git ~/cj-projects/software
export cj_softwareHome=$HOME/cj-projects/software

#define shell-visible environment variables
echo "127.0.0.1             devdb.db.cj.com" | sudo tee -a /etc/hosts
echo "\nexport DEVDB_HOST=devdb.db.cj.com
export DEVDB_USERNAME=spud
export DEVDB_PORT=1521
export DEVDB_SID=devdb" >> ~/.profile

#Git Config
  echo "\n[color]
    diff = auto
    status = auto
    branch = auto
[core]
    excludesfile = ~/.gitignore
[alias]
    co = checkout
    ff = merge --ff-only
    pff = pull --ff-only
    backup = push --all origin
    sync = fetch upstream
    dlog = log --decorate
    ilog = log --oneline --decorate
    glog = log --oneline --decorate --graph
    hist = log --oneline --decorate --all --graph
    ifetch = fetch -p --no-tags
    tree = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" >> ~/.gitconfig

if [[ " ${CASKS[@]} " =~ " visual-studio-code " ]]; then
  export PATH="${PATH}:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  ## VS_EX : https://github.com/JustusAdam/language-haskell
  code --install-extension justusadam.language-haskell
  ## VS_EX : https://gitlab.com/vannnns/haskero, PRE_REQ : https://github.com/commercialhaskell/intero/blob/master/TOOLING.md#installing
  stack build intero
  code --install-extension Vans.haskero
  ### VS_EX : https://github.com/aaron-bond/better-comments
  code --install-extension aaron-bond.better-comments
  ### VS_EX : https://github.com/eamodio/vscode-gitlens
  code --install-extension eamodio.gitlens
  ### VS_EX : https://github.com/DavidAnson/vscode-markdownlint
  code --install-extension DavidAnson.vscode-markdownlint
fi

###############################################################################
section "Post Items"
#useful themes for iTerm2
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git ~/github/iTerm2-Color-Schemes
#useful fonts
git clone https://github.com/google/fonts.git ~/github/google-fonts

info "Generating SHA Key"
detail "  Hit enter to accept default directory"
detail "  Leave passphrase empty"
ssh-keygen -t rsa
