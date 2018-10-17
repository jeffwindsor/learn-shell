function generate.delimited_tuple_list(){
# USAGE: DELIMITER, FUNCTION_NAME, TUPLE_LIST
  for item in "${@:3}"; do
    f=${item%${1}*}
    g=${item#*${1}}
    $2 "${f}" "${g}"
  done
}
