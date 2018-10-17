#!/usr/ocal/bin/fish
###############################################################################
# * Auto execute with: curl -L {rawurl} | fish
###############################################################################
set -l packages="fonts powerline agnoster shellder lambda bobthefish pure fish_logo archlinux gi"
for a in $packages
  omf install $a
end