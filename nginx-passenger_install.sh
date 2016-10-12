red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr0`
background=`tput setab 7`
echo "${red}${background update.......}"
sudo apt-get update


echo "${green}install passenger + nginx .................${reset}"

#add passenger repo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7

echo "${green} install ca-certificates${reset}"
echo "${blue}${background} sudo apt-get install -y apt-transport-https ca-certificates${reset}"
sudo apt-get install -y apt-transport-https ca-certificates

echo "${green}add apt repo.......${reset}"


sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'

echo "${red}${background update.......}"
sudo apt-get update

echo "${green}install nginx..............${reset}"
sudo apt-get install -y nginx-extras passenger

echo "${green}{background}############################################################################${reset}"
echo "${green}{background}# add following two line in /etc/nginx/nginx.conf                          #${reset}"
echo "${green}{background}# passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;#${reset}"
echo "${green}{background}# passenger_ruby /home/deploy/.rbenv/shims/ruby; # If you use rbenv        #${reset}"
echo "${green}{background}############################################################################${reset}"

