SECTION_BG_COLOR=25
HIGH_FG_COLOR=255
TEXT_FG_COLOR=250
INFO_FG_COLOR=39
WARNING_FG_COLOR=178
ERROR_FG_COLOR=196

fg(){ printf "\e[38;5;"${1}"m";}
bg(){ printf "\e[48;5;"${1}"m"; }
clear(){ printf "\e[0m"; }
print_fill_width() { 
    TEXT=${1:-}
    SPACER=${2:- }
    printf "${TEXT}$(seq -s "${SPACER}" $((${#TEXT} + 1)) $(tput cols) | tr -d '[:digit:]')"; 
}
println_clear(){ printf "${1}$(clear)"; echo; }
section(){ 
    printf "$(bg $SECTION_BG_COLOR)$(fg $HIGH_FG_COLOR)$(print_fill_width)\n$(print_fill_width " ${1}")\n$(print_fill_width)$(clear)"; echo;
}
error()  { println_clear "$(fg $ERROR_FG_COLOR)Error: $(fg $TEXT_FG_COLOR)${1}"; }
warning(){ println_clear "$(fg $WARNING_FG_COLOR)Warning: $(fg $TEXT_FG_COLOR)${1}"; }
info()   { println_clear "$(fg $INFO_FG_COLOR)==> $(fg $TEXT_FG_COLOR)${1}"; }

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

print256ColorGrid(){
  for fgbg in 38 48 ; do # Foreground / Background
      for color in {0..255} ; do # Colors
          # Display the color
          printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
          # Display 6 colors per lines
          if [ $((($color + 1) % 6)) == 4 ] ; then
              echo # New line
          fi
      done
      echo # New line
  done
}