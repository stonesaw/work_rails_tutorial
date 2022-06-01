# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

set :application, "depot"
set :repo_url, "git@github.com:stonesaw/work_rails_tutorial.git"
set :deploy_to, "/var/depot"

# Default branch is :master
set :branch, "main"
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name


# set :rbenv_type, :user
# set :rbenv_ruby, ''

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'
append :linked_files, 'config/master.key', 'config/credentials.yml.enc'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, '3.0.0'

set :rbenv_path, '/home/sou/.rbenv'
# set :bundle_path, -> { shared_path.join('vendor/bundle') }

domain = "depot.yourhost.com"

role :app, domain
role :web, domain
role :db, domain, primary: true

namespace :deploy do
  desc "reload the database width seed data"
  task :seed do
    run "cd #{current_path}; bin/rails db:seed RAILSENV=#{rails_env}"
    run "EDITOR='cat' bin/rails credentials:edit --environment production"
  end
end
