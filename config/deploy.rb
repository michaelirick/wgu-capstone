# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "wgu-capstone"
set :repo_url, "git@github.com:michaelirick/wgu-capstone.git"


set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'storage')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

set :passenger_restart_with_touch, true
set :rbenv_type, :user
set :rbenv_ruby, '2.4.1'
set :rbenv_map_bins, %w[rake gem bundle ruby rails]
set :pty, true

# puma config
# set :puma_conf, "#{shared_path}/config/puma.rb"
# set :puma_bind, 'tcp://0.0.0.0:8181'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/ebs/www/christiescompanions"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
set :ssh_options, {
  forward_agent: true,
  auth_methods: %w[publickey],
  keys: %w[~/Downloads/web01.pem]
}
