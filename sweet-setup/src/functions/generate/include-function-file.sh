#USAGE: ShellEchoFunction, OutputFile, Array
function generate.include_function_file(){
  echo "GENERATING INCLUDE FILE: ${2}"
  echo -e "# generated by src/generate-includes.sh" > $2
  echo "" >> $2
  echo "function ${3}(){" >> $2
  for item in "${@:6}"; do
    $1 "${4}${item%${alias_delimiter}*}" "${5}${item#*${alias_delimiter}}" >> $2
  done
  echo "}" >> $2
}