red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr0`
background=`tput setab 7`

echo "${green}install ruby .............${reset}"
echo "${blue}${background} rbenv install 2.3.1${reset}"

###################
rbenv install 2.3.1
rbenv global 2.3.1

echo "${green}ruby version: ${reset}"
ruby -v

echo "${green}ruby bundler install${reset}"
echo "${blue}${background} gem install bundler${reset}"

##################
gem install bundler

rbenv rehash