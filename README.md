# Deploy-Environment-setup
Rails application deploy environment setup



<h1>NgiNx config.</h1>
copy and paste nginx.conf file to /etc/nginx/ </br>
After Editing server_name and root of application, </br>
copy and paste default_server file to /etc/nginx/site-enable

<h1>Setup capistrano in rails app.</h1>
<ul>
  <li>First add capistrano, capistrano-bundler, capistrano-rails gam in gemfile.</li>
  <li>Once these are added, <b>run bundle --binstubs</b> and then <b>cap install STAGES=production</b> to generate your capistrano configuration.</li>
</ul>

<h2>Edit capfile</h2>
Need to make some additions to Capfile to include bundler, rails, and rbenv/rvm (if you're using them). Edit your Capfile and add these lines:
<pre>
require 'capistrano/bundler'
require 'capistrano/rails'

If you are using rbenv add these lines:
- require 'capistrano/rbenv'
- set :rbenv_type, :user # or :system, depends on your rbenv setup
- set :rbenv_ruby, '2.0.0-p451'

If you are using rvm add these lines:
- require 'capistrano/rvm'
- set :rvm_type, :user
- set :rvm_ruby_version, '2.0.0-p451'
</pre>
<h2>Edit config/deploy.rb</h2>
configure the config/deploy.rb to setup our general configuration for app. Edit that file and make it like the following replacing "myapp" with the name of your application and git repository:
<pre>
set :application, 'myapp'
set :repo_url, 'git@github.com:excid3/myapp.git'

set :deploy_to, '/home/deploy/myapp'

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
</pre>
<h2>Edit config/deploy/production.rb</h2>
open up config/deploy/production.rb file to set the server IP address that we want to deploy to:
<pre>
set :stage, :production

# Replace 127.0.0.1 with your server's IP address!
server '127.0.0.1', user: 'deploy', roles: %w{web app db}

</pre>
