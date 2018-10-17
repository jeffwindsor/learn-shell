#create a list of install functions to confirm
installs+=($(compgen -A function | grep "preinstall\."));
installs+=($(compgen -A function | grep "install\."));
installs+=($(compgen -A function | grep "postinstall\."));
#confirm each script with user
for f in "${installs[@]}"; do
  echo -n "$f [y/N]: "; read -e answer;
  if [ "$answer" == "y" ]; then
    confirmed_installs+=( "${f}" )
  fi
done
#execute each confirmed script
for c in "${confirmed_installs[@]}"; do
  echo -e "\e[48;5;4m\e[38;5;4m$(seq -s '-' 1 $(tput cols) | tr -d '[:digit:]')\e[0m"
  echo -e "\e[38;5;250m \e[38;5;4m ${c} \e[0m";
  echo -e;
  $c;
done