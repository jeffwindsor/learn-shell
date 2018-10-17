#!/bin/bash
###############################################################################
# USAGE: TARGET, OS, SOURCES
source ./functions/generate/stand-alone-file.sh
###############################################################################
#USAGE SCRIPTS SPACE DELIMITED
function add_scripts(){
  scripts+=( "${@}" )
}
#USAGE: directory
function add_folder_scripts(){
  add_scripts includes/ascii-art/${1}.sh;
  for file in ./includes/${1}/*; do
    add_scripts "${file#./}"
  done
}
#USAGE: Message
function info(){
  echo -e "GENERATING STANDALONE SCRIPT: "${1};
}
function add_base_scripts(){
  scripts=()
  add_scripts data-variables.sh;
}
function add_development_scripts(){
  add_folder_scripts development
  add_folder_scripts fish
  add_folder_scripts bash
  add_folder_scripts git
}
###############################################################################
./generate-includes.sh

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
#add-git-workflow-cj.sh########################################################
add_base_scripts
add_scripts includes/bash/bash-git-workflow-cj.sh
generate.stand_alone_file ../add-git-workflow-cj.sh
#add-git-workflow.sh###########################################################
add_base_scripts
add_scripts includes/bash/bash-git-workflow.sh
generate.stand_alone_file ../add-git-workflow.sh

#macos-setup.sh################################################################
#                                                   $MMMMMMMMM       :MMMMMMMMM
#                                                 ,MMMMO  ,MMMMM    MMMM:   MMMM
#                                                 MMM7       MMMM   MMM       MMM
# MMM MMMMMM 8MMMMMM    $MMMMMMMO     MMMMMMMN   MMMO         MMM:  MMM
# MMMM7 ~MMMMM= ?MMMM  MMMM   MMMM  MMMM~  MMMM  MMM          MMMM  MMMMMM=
# MMM     MMM     MMM  ,,,     MMM  MMM     ~MMZ MMM          ~MMM   ~MMMMMMMMM
# MMM     MMM     MMM     MMMMMMMM OMMN          MMM          ZMMM        ?MMMMMM
# MMM     MMM     MMM  MMMMMMMMMMM NMMD          MMMI         MMM~            MMM
# MMM     MMM     MMM MMMM     MMM  MMM      MMD ,MMM        MMMM  MMM:       MMM
# MMM     MMM     MMM DMMM    MMMM  MMMM    MMM   MMMMM    NMMMM    MMMM    ,MMMM
# MMM     MMM     MMM  MMMMMMM MMM   7MMMMMMMM      MMMMMMMMMM+      MMMMMMMMMM:
#                         ~             ,I?             $8+             :O8+
#macos-setup.sh################################################################
add_base_scripts
add_folder_scripts macos
add_development_scripts
generate.stand_alone_file ../macos-setup.sh

#manjaro-setup#################################################################
#
#    7777777777777777777777777. .$77777777777
#    7777777777777777777777777. .$77777777777
#    7777777777777777777777777. .$77777777777
#    7777777777777777777777777. .$77777777777
#    7777777777$$$$$$$$$$$$$$$. .$77777777777
#    7777777777$.               .$77777777777
#    7777777777$.  ,,,,,,,,,,,  .$77777777777
#    7777777777$. .77777777777. .$77777777777
#    7777777777$. .77777777777. .$77777777777
#    7777777777$. .77777777777. .$77777777777
#    7777777777$. .77777777777. .$77777777777
#    7777777777$. .77777777777. .$77777777777
#    7777777777$. .77777777777. .$77777777777
#    7777777777$. .77777777777. .$77777777777
#    7777777777$. .77777777777. .$77777777777
#    7777777777$. .77777777777. .$77777777777
#    7777777777$. .77777777777. .$77777777777
#
#manjaro-setup#################################################################
add_base_scripts
add_folder_scripts manjaro
add_development_scripts
generate.stand_alone_file ../manjaro-setup.sh

#ubuntu-setup.sh###############################################################
#
#           ..I$$$$$$$$$$$$$$..
#         .$$$$$$$$$$$$$$$$$$$$$.
#      ..$$$$$$$$$$$$$$$$$$$$$$$$$..
#     .$$$$$$$$$$$$$$$$$$$7...$$$$$$.
#    .$$$$$$$$$$$$$$$$$$$Z    .$$$$$$.
#   .$$$$$$$$$$$7..     .$.   .$$$$$$$=
#  .$$$$$$$$$$..$.       .$$$$$$$$$$$$$.
# .$$$$$$$$$Z.  ,$.7$$$Z.. ...~$$$$$$$$$.
# :$$$$$$$$I    7$$$$$$$$$$.   .$$$$$$$$$.
# $$$$$$$$$   .$$$$$$$$$$$$$.   7$$$$$$$$.
# $$$$$..$$. .$$$$$$$$$$$$$$$.  .$$$$$$$$.
# $$$7    .$ .$$$$$$$$$$$$$$$....$$$$$$$$~
# $$$+    .Z  $$$$$$$$$$$$$$$===?$$$$$$$$=
# $$$$$. +$. .$$$$$$$$$$$$$$$.  .$$$$$$$$.
# $$$$$$$$Z   .$$$$$$$$$$$$$.   +$$$$$$$$.
# +$$$$$$$$:   .$$$$$$$$$$$.   .$$$$$$$$$.
# .$$$$$$$$$+.  .$:$$$$$7.   ..$$$$$$$$$.
#  .$$$$$$$$$$ .$.       .Z$$$$$$$$$$$$=
#   ,$$$$$$$$$$$?.      .$.  ..$$$$$$$$
#    .$$$$$$$$$$$$$$$$$$$$    .$$$$$$?
#     .$$$$$$$$$$$$$$$$$$$... $$$$$$.
#      ..$$$$$$$$$$$$$$$$$$$$$$$$$?.
#         .$$$$$$$$$$$$$$$$$$$$$~.
#           ..$$$$$$$$$$$$$$$~.
#               ....~+~,...
#
#ubuntu-setup.sh###############################################################
add_base_scripts
add_folder_scripts ubuntu
generate.stand_alone_file ../ubuntu-setup.sh