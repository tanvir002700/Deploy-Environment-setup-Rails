sudo apt-get update

echo 'set up git'
sudo apt-get git -y

echo 'setup dependencies for Ruby.........................'
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y

echo 'setup rbenv............................'
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

echo 'setup ruby build...............................'
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

echo 'install ruby .............'
rbenv install 2.3.1
rbenv global 2.3.1

echo 'ruby version: '
ruby -v

echo 'ruby bundler install'
gem install bundler

echo 'install passenger + nginx'.................

#add passenger repo
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
sudo apt-get install -y apt-transport-https ca-certificates

echo 'add apt repo.......'


sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'
sudo apt-get update

echo 'install..............'
sudo apt-get install -y nginx-extras passenger

echo '############################################################################'
echo '# add following two line in /etc/nginx/nginx.conf                          #'
echo '# passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;#'
echo '# passenger_ruby /home/deploy/.rbenv/shims/ruby; # If you use rbenv        #'
echo '############################################################################'

echo ''
echo 'install mysql..............'
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
