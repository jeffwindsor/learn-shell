function install.bash_shell(){
  add_package bash
}
function install.bash_git_aliases(){
  process.delimited_tuple_list_with_prepend \
    $alias_delimiter generate.bash_alias "g" "git " "${git_aliases[@]}"
}
function install.bash_shell_aliases(){
  process.delimited_tuple_list \
    $alias_delimiter generate.bash_alias "${shell_aliases[@]}"
}
function install.bash_greeting(){
  # ? TODO install a bash prompt
  # ? add_package lolcat
  # ? add_package fortune-mod
  # ?
}