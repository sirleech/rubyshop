require 'rvm/capistrano'

set :application, "rubyshop"
set :domain,      "54.252.88.222"
set :repository,  "git://github.com/sirleech/rubyshop.git"
set :use_sudo,    false
set :user,        "ubuntu"
set :deploy_to,   "/home/#{user}/#{application}"
set :scm,         "git"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  task :copy_db_yml, :roles => :app do
    # copy the real database config file
    run "cp ~/#{application}/database.yml.rubyshop #{current_release}/config/database.yml"
  end 

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  after "deploy:update_code", "deploy:copy_db_yml" 
end


