#!/bin/bash
###############################################################################
source data-aliases.sh
source data-variables.sh
source data-vscode-extensions.sh
source ./functions/generate/include-function-file.sh
source ./functions/generate/shell-functions.sh
source ./functions/generate/fortune-file.sh
###############################################################################
#
#    ad88
#   d8"                           ,d
#   88                            88
# MM88MMM ,adPPYba,  8b,dPPYba, MM88MMM 88       88 8b,dPPYba,   ,adPPYba,
#   88   a8"     "8a 88P'   "Y8   88    88       88 88P'   `"8a a8P_____88
#   88   8b       d8 88           88    88       88 88       88 8PP"""""""
#   88   "8a,   ,a8" 88           88,   "8a,   ,a88 88       88 "8b,   ,aa
#   88    `"YbbdP"'  88           "Y888  `"YbbdP'Y8 88       88  `"Ybbd8"'
#
###############################################################################
generate.fortune_file data-personal-quotes.txt ./includes/fortunes/personal-quotes
strfile ./includes/fortunes/personal-quotes ./includes/fortunes/personal-quotes.dat

###############################################################################
#
#                     $$$$$$$$$$$
#      ?????        $$$$$$$$ZZZ$$$
#   ~?++==++?I    7$$$$$$$$$$Z???Z$
#  ~?+==~~~=+I$Z 777$$$$$$$  +OOOOO$
#  ??+=        $77777$$$I     $ZZZZZ
#  7I?        II777777?       77$$$$
#   ~77      +IIIII777         777777
#    II~  =IIIIIIIIIZZ        III777
#     77IIIIIIIIII   77II?   IIIIII
#        7IIIII        $777777777
#
###############################################################################
  # for ext in "${vscode_exts[@]}"; do
  #   add_vscode_ext $ext
  # done
function echo.vscode_install_ext(){
  echo -e "  code --install-extension \""${1}"\""
}
generate.include_function_file echo.vscode_install_ext ./includes/development/vscode-install-exts.sh \
  "install.vscode_install_exts" "" "" "${vscode_extensions[@]}"

###############################################################################
#         .-ossyyyysso-.         yyyyyy,         oooooo,
#      .ssyyyyyyyyyyyyyyss:      yyyyyy,         oooooo,
#    .+yyyyyyyyyyyyyyyyyyyy:.    yyyyyy,         oooooo,
#   .yyyyyyyys.````.syyyyyyy:.   yyyyyy,         oooooo,
#  .yyyyyyy:          +yyyyyy:   yyyyyy,         oooooo,
#  oyyyyyy-            ......`   yyyyyy,         oooooo,
#  yyyyyys                       yyyyyy,  oooooooooooooooooooo
# :yyyyyy+       yyyyyyyyyyyy,   yyyyyy,  oooooooooooooooooooo
# .yyyyyyo       yyyyyyyyyyyy,   yyyyyy,  oooooooooooooooooooo
#  yyyyyyy`      ``````.syyyy,   yyyyyy,         oooooo,``````
#  :yyyyyys.          .:yyyyy,   yyyyyy,         oooooo,
#   :yyyyyyy:.      .:oyyyyyy,   yyyyyy,         oooooo,
#    :yyyyyyyyyyyyyyyyyyyyyyy,   yyyyyy,         oooooo,
#     `:syyyyyyyyyyyyyy: yyyy,   yyyyyy,         oooooo,
#        `:+ossyyssoo-`  yyyy,   yyyyyy,         oooooo,
###############################################################################
function echo.git_global_alias(){
  echo -e "  git config --global alias.${1} \"${2}\""
}
###############################################################################
# Create a single global git alias call for each git alias
# Output to includes/git folder as single files
generate.include_function_file echo.git_global_alias ./includes/git/git-globals.sh \
  "install.git_global_aliases" "" "" "${git_aliases[@]}"

###############################################################################
#                ___
#  ___======____=---=)
#/T            \_--===)
#[ \ (O)   \~    \_-==)
# \      / )J~~    \-=)
#  \\___/  )JJ~~~   \)
#   \_____/JJJ~~~~    \
#   / \  , \J~~~~~     \
#  (-\)\=|\\\~~~~       L__
#  (\\)  (\\\)_           \==__
#   \V    \\\) ===_____   \\\\\\
#          \V)     \_) \\\\JJ\J\)
#                      /J\JT\JJJJ)
#                      (JJJ| \UUU)
#                       (UU)
###############################################################################
#USAGE Name,  Value, line prepend (optional)
function echo.fish_alias(){
  echo -e ${3}"alias ${1} ${2}"
}
#USAGE Name,  Value, line prepend (optional)
function echo.fish_function(){
  echo ${3}"  echo -e \"function ${1}"
  echo -e ${3}"  ${2}"
  echo ${3}"end\" > \${fish_function_path}/${1}.fish"
}
generate.shell_functions fish

###############################################################################
# BASH
#                       /^--^\     /^--^\     /^--^\
#                       \____/     \____/     \____/
#                      /      \   /      \   /      \
#                     |        | |        | |        |
#                      \__  __/   \__  __/   \__  __/
# |^|^|^|^|^|^|^|^|^|^|^|^\ \^|^|^|^/ /^|^|^|^|^\ \^|^|^|^|^|^|^|^|^|^|^|^|
# | | | | | | | | | | | | |\ \| | |/ /| | | | | | \ \ | | | | | | | | | | |
# ########################/ /######\ \###########/ /#######################
# | | | | | | | | | | | | \/| | | | \/| | | | | |\/ | | | | | | | | | | | |
# |_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|
#
###############################################################################
#USAGE Name,  Value, line prepend (optional)
function echo.bash_alias(){
  echo -e ${3}"alias ${1}=\"${2}\""
}
#USAGE Name,  Value, line prepend (optional)
function echo.bash_function(){
  echo ${3}"  echo -e \"function ${1}(){"
  echo -e ${3}"  ${2}"
  echo ${3}"}\" > \${bash_config_file}"
}
generate.shell_functions bash


#
# ? TODO: ZSHELL
#