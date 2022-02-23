set :stage, :staging
set :deploy_to, -> { "/home/[YOUR USERNAME]/www/[YOUR DOMAIN]" }
set :tmp_dir, "/home/[YOUR USERNAME]/www/[YOUR DOMAIN]/tmp"
set :keep_releases, 2

#deploy certain branch: cap staging deploy BRANCH=branch_name
#http://stackoverflow.com/a/9068104/6157905
set :branch, ENV['BRANCH'] if ENV['BRANCH']

# Simple Role Syntax
# ==================
#role :app, %w{deploy@example.com}
#role :web, %w{deploy@example.com}
#role :db,  %w{deploy@example.com}

# Extended Server Syntax
# ======================
server '[YOUR DOMAIN]', user: '[YOUR USERNAME]', port: 18765, password: 'ssh.St34lth!', roles: %w{web app db}

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(~/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }

fetch(:default_env).merge!(wp_env: :staging)

SSHKit.config.command_map[:bash] = "/usr/bin"
#SSHKit.config.command_map[:composer] = "php -d memory_limit=512M -d allow_url_fopen=1 -d suhosin.executor.include.whitelist=phar /var/www/vhosts/ql2j-whfn.accessdomain.com/composer.phar"
SSHKit.config.command_map[:composer] = "/usr/bin/php /home/[YOUR USERNAME]/composer.phar"
