function gitioshort
  curl -i https://git.io -F "url=$argv[2]" -F "code=$argv[1]"
end

#gitioshort "the-macos-int" "https://raw.githubusercontent.com/jeffwindsor/the-sweet-setup/master/scripts/macos/init.sh"
#gitioshort "the-macos-dev-setup" "https://raw.githubusercontent.com/jeffwindsor/the-sweet-setup/master/scripts/macos/dev-setup.sh"
#gitioshort "the-manjaro-init" "https://raw.githubusercontent.com/jeffwindsor/the-sweet-setup/master/scripts/manjaro/init.sh"
#gitioshort "the-manjaro-dev-setup" "https://raw.githubusercontent.com/jeffwindsor/the-sweet-setup/master/scripts/manjaro/dev-setup.sh"
