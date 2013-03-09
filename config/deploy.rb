set :application, "rubyshop"
set :domain,      "54.252.88.222"
set :repository,  "git://github.com/sirleech/rubyshop.git"
set :use_sudo,    false
set :deploy_to,   "/home/chris/#{application}"
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

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end


