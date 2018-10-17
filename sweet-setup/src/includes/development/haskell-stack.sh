function install.haskell_stack(){
  curl -sSL https://get.haskellstack.org/ | sh
  # Green imports, White On Blue Prompt
  #echo ":set prompt \"\ESC[32m\STX%s\ESC[0m\STX\n\STX\ESC[44m\STX\ESC[97m\STX λ \ESC[m\STX\ESC[34m \ESC[m\STX\"" > "${HOME}/.ghci"
  # Grey imports, Red and Grey haskell symbol
  echo ":set prompt \"\ESC[38;5;242m\STX%s\n\ESC[38;5;161m❯\ESC[1;34mλ= \ESC[0m\"" > "${HOME}/.ghci"
}

# "vigoo.stylish-haskell"
function install.haskell_stylish(){
  stack install stylish-haskell
}

# "alanz.vscode-hie-server"
function install.haskell_ide_server(){
  target="${source_dir}/sys/haskell-ide-engine"
  git clone https://github.com/haskell/haskell-ide-engine  $target --recursive
  cd $target
  make build-all
}
