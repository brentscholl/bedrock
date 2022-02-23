# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Undefined method `on' for main:Object when using SSHKit 1.9 with Capistrano 3.1.0
# https://github.com/capistrano/sshkit/issues/338
# include SSHKit::DSL

# Includes default deployment tasks
require 'capistrano/deploy'

# Load tasks from gems
require 'capistrano/composer'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
# Customize this path to change the location of your custom tasks.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }

