red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr0`
background=`tput setab 7`
echo "${red}${background update.......}"

sudo apt-get update

echo "${green}set up git..........${reset}"
echo "${blue}${background} sudo apt-get install git -y${reset}"
sudo apt-get install git -y


echo ''

