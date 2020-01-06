# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/puma'
require 'capistrano/ssh_doctor'
require "whenever/capistrano"
install_plugin Capistrano::Puma

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
set :linked_files, %w{config/secrets.yml config/database.yml}
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
