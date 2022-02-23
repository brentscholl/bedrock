set :stage, :staging
set :deploy_to, -> { "/home/u17-hbp2ge6mt3vp/www/[YOUR SUB DOMAIN].cloudcreations.ca" }
set :tmp_dir, "/home/u17-hbp2ge6mt3vp/www/[YOUR SUB DOMAIN].cloudcreations.ca/tmp"
# ^^^ If you are not using cloudcreations.ca subdomain, Replace lines above with lines below ******************************
# set :deploy_to, -> { "/home/[YOUR USERNAME]/www/staging.[YOUR DOMAIN].com" }
# set :tmp_dir, "/home/[YOUR USERNAME]/www/staging.[YOUR DOMAIN].com/tmp"

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
server 'cloudcreations.ca', user: 'u17-hbp2ge6mt3vp', port: 18765, password: 'ssh.St34lth!', roles: %w{web app db}
# ^^^ If you are not using cloudcreations.ca subdomain, Replace line above with line below ********************************
# server '[YOUR DOMAIN]', user: '[YOUR USERNAME]', port: 18765, password: 'ssh.St34lth!', roles: %w{web app db}

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(~/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }

fetch(:default_env).merge!(wp_env: :production)

SSHKit.config.command_map[:bash] = "/usr/bin/bash"
#SSHKit.config.command_map[:composer] = "php -d memory_limit=512M -d allow_url_fopen=1 -d suhosin.executor.include.whitelist=phar /var/www/vhosts/ql2j-whfn.accessdomain.com/composer.phar"

SSHKit.config.command_map[:composer] = "/usr/bin/php /home/u17-hbp2ge6mt3vp/composer.phar"
# ^^^ If you are not using cloudcreations.ca subdomain, Replace line above with line below ********************************
# SSHKit.config.command_map[:composer] = "/usr/bin/php /home/[YOUR USERNAME]/composer.phar"