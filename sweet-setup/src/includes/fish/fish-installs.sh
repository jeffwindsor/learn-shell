function install.fish_shell(){
  add_package fish
}
function install.fish_greeting(){
  # Cloning Powerline Fonts used for some prompts in OMF
  git clone https://github.com/powerline/fonts.git "$source_dir/sys/fonts/powerline" --depth=1

  #add_package lolcat
  # fortunes located: (mac)/usr/local/share/games/fortunes (linux)/usr/share/games/fortunes
  # generate file by: strfile mytextfile quotes.dat
  add_package fortune-mod
  curl -L https://raw.githubusercontent.com/jeffwindsor/the-sweet-setup/master/src/parts/fortunes/personal-sayings > /usr/local/share/games/fortunes/personal-sayings
  curl -L https://raw.githubusercontent.com/jeffwindsor/the-sweet-setup/master/src/parts/fortunes/personal-sayings.dat > /usr/local/share/games/fortunes/personal-sayings.dat

  # Fish shell greeting - stored as a function
  generate_fish_function "fish_greeting" "fish_logo red brred yellow\n  fortune personal-sayings"
}
function install.fish_omf(){
  # OH MY FISH FRAMEWORK
  curl -L https://get.oh-my.fish | fish
}