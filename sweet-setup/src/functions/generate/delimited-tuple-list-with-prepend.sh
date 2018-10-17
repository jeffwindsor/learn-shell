function generate.delimited_tuple_list_with_prepend(){
# USAGE: DELIMITER, FUNCTION_NAME, PREPEND_ONE, PREPEND_TWO, TUPLE_LIST
  for item in "${@:5}"; do
    f=${item%${1}*}
    g=${item#*${1}}
    $2 "${3}${f}" "${4}${g}"
  done
}
