#USAGE: input, output
function generate.fortune_file(){
  echo "GENERATING FORTUNE DAT FILE: ${2}"
  while read -r line
  do
      echo -e "${line}\n%" >> $2
  done < "${1}"
}
