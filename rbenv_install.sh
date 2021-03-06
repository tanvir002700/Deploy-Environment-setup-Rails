red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr0`
background=`tput setab 7`

echo "${green}setup dependencies for Ruby.........................${reset}"
echo "${blue}${background}sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y${reset}"

################################################################################################################
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y

echo "${green}setup rbenv............................${reset}"
echo "${blue}${background} git clone https://github.com/rbenv/rbenv.git ~/.rbenv${reset}"

#######################################################
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

echo "${green}setup ruby build...............................${reset}"
echo "${blue}${background}git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build${reset}"

#############################################################################
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

echo "${red}${background} Reload shell.${reset}"
source ~/.bashrc

