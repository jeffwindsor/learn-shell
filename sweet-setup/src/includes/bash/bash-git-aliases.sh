# generated by src/generate-includes.sh

function install.bash-git-aliases(){
  echo -e "function gs(){
  git status -sb --ignore-submodules
}" > ${bash_config_file}
  echo -e "function gd(){
  git diff
}" > ${bash_config_file}
  echo -e "function gaa(){
  git add --all
}" > ${bash_config_file}
  echo -e "function gcm(){
  git commit -m
}" > ${bash_config_file}
  echo -e "function gcma(){
  git commit -a -m
}" > ${bash_config_file}
  echo -e "function gb(){
  git branch
}" > ${bash_config_file}
  echo -e "function gco(){
  git checkout
}" > ${bash_config_file}
  echo -e "function gcob(){
  git checkout -b
}" > ${bash_config_file}
  echo -e "function gpff(){
  git pull --ff-only
}" > ${bash_config_file}
  echo -e "function gmff(){
  git merge --ff-only
}" > ${bash_config_file}
  echo -e "function gsize(){
  git count-objects -vH
}" > ${bash_config_file}
  echo -e "function gremove(){
  git rm -r --cached .
}" > ${bash_config_file}
  echo -e "function ghist(){
  git log --graph --max-count=100 --pretty=format:\"%C(green)%h%C(reset) | %C(yellow)%d%C(reset) %s %C(cyan)%an : %C(dim)%cr%C(reset)\" --abbrev-commit
}" > ${bash_config_file}
}
