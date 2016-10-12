red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr0`
background=`tput setab 7`
echo "${red}red text ${green}green text${reset}"

sudo apt-get update

echo "${green}set up git.........."
echo "${blue}{background} sudo apt-get install git -y"
sudo apt-get install git -y

echo "${green}setup dependencies for Ruby........................."
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y

echo "${green}setup rbenv............................"
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

echo "${green}setup ruby build..............................."
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

echo "install ruby ............."
echo "${blue}${background} rbenv install 2.3.1"
rbenv install 2.3.1
rbenv global 2.3.1

echo "${green}ruby version: "
ruby -v

echo "${green}ruby bundler install"
echo "${blue}{background} gem install bundler"
gem install bundler

echo "${green}install passenger + nginx ................."

#add passenger repo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7

echo "${green} install ca-certificates"
echo "${blue}{background} sudo apt-get install -y apt-transport-https ca-certificates"
sudo apt-get install -y apt-transport-https ca-certificates

echo "${green}add apt repo......."


sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'

sudo apt-get update

echo "${green}install nginx.............."
sudo apt-get install -y nginx-extras passenger

echo "${green}{background}############################################################################"
echo "${green}{background}# add following two line in /etc/nginx/nginx.conf                          #"
echo "${green}{background}# passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;#"
echo "${green}{background}# passenger_ruby /home/deploy/.rbenv/shims/ruby; # If you use rbenv        #"
echo "${green}{background}############################################################################"

echo ''
echo "${green}install mysql.............."
echo "${blue}{background}sudo apt-get install mysql-server mysql-client libmysqlclient-dev"
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
