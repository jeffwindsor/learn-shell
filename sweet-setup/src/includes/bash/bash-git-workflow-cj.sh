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
