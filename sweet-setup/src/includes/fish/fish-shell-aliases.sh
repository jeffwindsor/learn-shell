# generated by src/generate-includes.sh

function install.fish-shell-aliases(){
  echo -e "function l
  builtin ls -CF
end" > ${fish_function_path}/l.fish
  echo -e "function ls
  builtin ls -CF
end" > ${fish_function_path}/ls.fish
  echo -e "function ll
  builtin ls -lhA
end" > ${fish_function_path}/ll.fish
  echo -e "function lll
  builtin ls -lhFA | less
end" > ${fish_function_path}/lll.fish
  echo -e "function o
  builtin open .
end" > ${fish_function_path}/o.fish
  echo -e "function c
  code .
end" > ${fish_function_path}/c.fish
  echo -e "function cd..
  cd ..
end" > ${fish_function_path}/cd...fish
  echo -e "function ...
  cd ../../
end" > ${fish_function_path}/....fish
  echo -e "function ....
  cd ../../../
end" > ${fish_function_path}/.....fish
  echo -e "function .....
  cd ../../../../
end" > ${fish_function_path}/......fish
}