red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr0`
background=`tput setab 7`

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