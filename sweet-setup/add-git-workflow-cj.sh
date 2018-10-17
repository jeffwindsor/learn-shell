#!/bin/bash
###############################################################################
# generated by src/generate-scripts.sh
###############################################################################
# * Auto execute with this script with this command: bash <(curl -L {url-to-raw-file})
# inlined from src/data-variables.sh
fish_function_path="${HOME}/.config/fish/functions"
bash_config_file="${HOME}/.bashrc"
source_dir="${HOME}/src"
###############################################################################
# inlined from src/includes/bash/bash-git-workflow-cj.sh
# generated by src/generate-includes.sh

function install.bash-git-workflow-cj(){
  echo -e "function cpush(){
  git push
}" > ${bash_config_file}
  echo -e "function cpull(){
  git pull --rebase --prune
git submodule update --init --recursive
}" > ${bash_config_file}
  echo -e "function cundo(){
  git reset HEAD~1 --mixed
}" > ${bash_config_file}
  echo -e "function creset(){
  git add -A
git commit -qm 'CLEAN POINT'
git reset HEAD~1 --hard
git clean -f -d
}" > ${bash_config_file}
  echo -e "function cinit(){
  git init
gi osx >> .gitignore
echo \"# READ.ME\" >> README.md
gcommit \"Initial\"
if test -n \$argv
  gconnect \$repo_uri
  git push -u origin master
end
}" > ${bash_config_file}
  echo -e "function cconnect(){
  git remote add origin \$argv
git remote -v
}" > ${bash_config_file}
  echo -e "function cbranch(){
  git checkout -b \$argv
}" > ${bash_config_file}
  echo -e "function ccommit(){
  git add -A
if test -n \"\$argv\"
      git commit -m \"\$argv\"
  else
      git commit -m \"WIP\"
  end
}" > ${bash_config_file}
  echo -e "function cmerge(){
  set merge_branch (git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
git checkout master
gpull
git rebase -i master
git merge \$merge_branch
}" > ${bash_config_file}
}

###############################################################################
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