#USAGE ShellName/IncludeFolder
function generate.shell_functions(){
  ###############################################################################
  # Create a single {shell} function for each alias
  #   prepend name with 'g'
  #   prepend body with 'git ' to make a shell command not git alias
  # Output to includes/{shell} folder as single files
  generate.include_function_file echo.${1}_function ./includes/${1}/${1}-git-aliases.sh \
    "install.${1}-git-aliases" "g" "git " "${git_aliases[@]}"
  ###############################################################################
  # Create a single {shell} function for each alias
  # Output to includes/{shell} folder as single files
  generate.include_function_file echo.${1}_function ./includes/${1}/${1}-shell-aliases.sh \
    "install.${1}-shell-aliases" "" "" "${shell_aliases[@]}"
  ###############################################################################
  # Create a single {shell} function for each git workflow
  # Output to includes/{shell} folder as single files
  generate.include_function_file echo.${1}_function ./includes/${1}/${1}-git-workflow.sh \
    "install.${1}-git-workflow" "" "" "${git_workflow[@]}"
  ###############################################################################
  # Create a single {shell} function for each git workflow
  # Output to includes/{shell} folder as single files
  generate.include_function_file echo.${1}_function ./includes/${1}/${1}-git-workflow-cj.sh \
    "install.${1}-git-workflow-cj" "" "" "${git_workflow_cj[@]}"
  ###############################################################################
  # Create a single {shell} function for each haskell stack alias
  # Output to includes/{shell} folder as single files
  generate.include_function_file echo.${1}_function ./includes/${1}/${1}-haskell-stack-workflow.sh \
    "install.${1}-haskell-stack-workflow" "" "" "${haskell_stack_workflow[@]}"
}
