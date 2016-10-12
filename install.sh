red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr0`
background=`tput setab 7`
echo "${red}red text ${green}green text${reset}"

sudo apt-get update

echo "${green}set up git..........${reset}"
echo "${blue}{background} sudo apt-get install git -y${reset}"
sudo apt-get install git -y

echo "${green}setup dependencies for Ruby.........................${reset}"
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y

echo "${green}setup rbenv............................${reset}"
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

echo "${green}setup ruby build...............................${reset}"
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

echo "${green}install ruby .............${reset}"
echo "${blue}${background} rbenv install 2.3.1${reset}"
rbenv install 2.3.1
rbenv global 2.3.1

echo "${green}ruby version: ${reset}"
ruby -v

echo "${green}ruby bundler install${reset}"
echo "${blue}{background} gem install bundler${reset}"
gem install bundler

echo "${green}install passenger + nginx .................${reset}"

#add passenger repo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7

echo "${green} install ca-certificates${reset}"
echo "${blue}{background} sudo apt-get install -y apt-transport-https ca-certificates${reset}"
sudo apt-get install -y apt-transport-https ca-certificates

echo "${green}add apt repo.......${reset}"


sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'

sudo apt-get update

echo "${green}install nginx..............${reset}"
sudo apt-get install -y nginx-extras passenger

echo "${green}{background}############################################################################${reset}"
echo "${green}{background}# add following two line in /etc/nginx/nginx.conf                          #${reset}"
echo "${green}{background}# passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;#${reset}"
echo "${green}{background}# passenger_ruby /home/deploy/.rbenv/shims/ruby; # If you use rbenv        #${reset}"
echo "${green}{background}############################################################################${reset}"

echo ''
echo "${green}install mysql..............${reset}"
echo "${blue}{background}sudo apt-get install mysql-server mysql-client libmysqlclient-dev${reset}"
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
