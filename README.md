# Cloud Creations Bedrock Notes
- [Getting Started](#getting-started)
  - [Laragon Local Development Installation](#laragon-local-development-installation)
  - [WSL Local Development Installation](#wsl-local-development-installation)
- [Starting a New Project](#starting-a-new-project)
- [Taking Over an Existing Project](#taking-over-an-existing-project)
- [Deployment](#deployment)
  - [Set up Staging Server](#set-up-staging-server)
  - [Laragon Deployment Pre Config](#laragon-deployment-pre-config)
  - [WSL Deployment Pre Config](#wsl-deployment-pre-config)
  - [Deploying Project](#deploying-project)
- [Project Management Workflow](#project-management-workflow)
  - [Production](#production)
- [WordPress Plugins](#wordpress-plugins)
- [Some Useful Console Commands](#some-useful-console-commands)
- [SQL Renaming Script](#sql-renaming-script)

## Getting Started
You have 2 options for Local Development Environment: **Laragon** and **WSL**

Below you will find instruction for installing each.

### Laragon Local Development Installation
1. Download Laragon (full) here -> https://laragon.org/download/
2. Install on your machine
3. Add `storm.bat` file to `C:/laragon/bin`. Find the `storm.bat` file here -> https://github.com/cloud-creations/bedrock/blob/master/storm.bat
4. Open Laragon, right click, Quick App > Configuration
    - Paste: 
    ```
    # WP Bedrock
    WordPress BedRock=composer create-project roots/bedrock %s
    ```
   <small>You might have issues with host file not updating. This could be because of the antivirus running. Turn off Kaspersky</small>

<br>
<br>

### WSL Local Development Installation
1. Follow this installation guide to install Linux -> https://docs.microsoft.com/en-us/windows/wsl/install-win10
2. Be sure to install Windows Terminal from Microsoft store
3. Once you have WSL running install LAMP Stack -> https://ssharizal.medium.com/how-to-install-lamp-stack-server-on-windows-subsystem-linux-wsl-windows-10-133419c22473
4. Using Windows Terminal, open a new Ubuntu console.
5. `cd ~` then follow this installation guied to install Composer **(Steps 1 & 2 only)** -> https://www.digitalocean.com/community/tutorials/how-to-install-and-use-composer-on-ubuntu-20-04
6. Add these helpful alias to your `.profile`. (be sure to update [YOUR NAME] with your computer's username)
    ```
   alias goto_web="cd /mnt/c/Users/[YOUR NAME]/Sites/"
   alias edit_hosts="sudo vi /mnt/c/Windows/System32/drivers/etc/hosts"
   alias edit_vhosts="cd /etc/apache2/sites-available"
   alias enable_site="sudo a2ensite"
   alias apache_start="sudo service apache2 start"
   alias apache_restart="sudo service apache2 restart"
   alias mysql_start="sudo service mysql start"
   alias reload_profile=". ~/.profile"
   alias subl='"/mnt/c/Program Files/Sublime Text 3/subl.exe"'
   alias pstorm='"/mnt/c/Program Files/JetBrains/PhpStorm 2020.3.3/bin/phpstorm.exe"'
   alias ssh_cloudcreations='ssh u17-hbp2ge6mt3vp@cloudcreations.ca -p 18765'
   alias git_cloudcreations="GIT_SSH_COMMAND='ssh -i ~/.ssh/id_rsa_cloudcreations'"
   ```
    - To edit your .profile, run this command `vi ~/.profile`
    - You can edit the file by pressing the `Ins` key or `i`
    - Press `Esc` to stop editing
    - Use `:w` to write/save `:q` to quit/exit or `:wq` to write and quit.
    - Once the aliases have been added reload your profile using this command `. ~/.profile`
6. cd `~/mnt/c/Users/[YOUR_USERNAME]` then make Sites directory. run `mkdir Sites`
7. Run `goto_web` to go to your server's main site directory.

<br>
<br>

## Starting a New Project
### Laragon
1. Open Laragon and click `Start All`.
2. Right click, *Quick app > WP Bedrock >* `[SITE NAME]`. This will install the project. <small>(A terminal window will open when the installation is completed. You can close this terminal window)</small>
3. Open Laragon's terminal and navigate to your new site's root folder within `www` ie. `C:\laragon\www\cloudcreations $ ` 
4. Run the command `storm.bat [SITE NAME]` ie. `storm.bat cloudcreations`

   <small>(Note: Laragon may open a new terminal window. close this window immediately)</small>
5. Create a Git repo for your newly created project. (git repo should be from root of project)
   - Go to github.com and create new repo.
   <small>Tip: Name your repo the same name as your project. ie. if project is `cloudcreations` name repo `cloudcreations`</small>
   - From the root of your local project run `git init && git add. && git commit -m "init"`
   - Run the git remote command provided when creating new repo. ie `git remote add origin git@github.com:cloud-creations/[REPO NAME].git`
   - Run `git push -u origin master`
   - Your new project was just added to your repo. push all new changes by running `git add . && git commit -m "[YOUR MESSAGE]" && git push`
6. You can then create a new project in your IDE from the root of your theme `C:laragon/www/[SITE NAME]/web/app/themese/sage`
7. Follow the Cloud Creations Sage Boilerplate instruction here https://github.com/cloud-creations/sage

<br>
<br>

### WSL
1. Start the apache server by running `apache_start`

******** DAN, CAN YOU WRITE THE REST OF THE STEPS HERE? ie. Setting up .test url, etc **************

<br>
<br> 

## Taking Over an Existing Project
If you need to take over/work on an already existing project, follow the steps below

### Laragon
You will first need to create a dev environment for the project.
1. Open Laragon and click `Start All`.
2. Right click, *Quick app > WordPress Bedrock >* `[PROJECT NAME]`. **Be sure to use the same name as the git repo that contains the project.** This will install the project. 
<small>(A terminal window will open when the installation is completed. You can close this terminal window)</small>
3. Open Laragon's terminal and navigate to laragon's `www` ie. `C:\laragon\www $ `
4. Now delete the newly created project folder  to make room for repo. run `rm -rf [PROJECT NAME]`.
5. Clone the project repo `git clone git@github.com:cloud-creations/[PROJECT NAME].git`
6. Move into new directory `cd [PROJECT NAME]`
7. Create a `.env` file in the root of your project. 
   - Run: `touch .env` to create file 
   - Run `vi .env` to edit file. 
   - Press `Ins` on your keyboard to start editing. Paste in your local credentials. Press `Esc` on your keyboard. Then `:wq` to save and close:
```
DB_NAME='[PROJECT NAME]'
DB_USER='root'
DB_PASSWORD=''

DB_HOST='localhost'
DB_PREFIX='wp_'

WP_ENV='development'

WP_HOME='https://[PROJECT NAME].test'

WP_SITEURL="${WP_HOME}/wp"

WP_DEBUG_LOG=/path/to/debug.log
AUTH_KEY="&sy&jkot]VU,k{>@O@,iqm8+7eXk6[DwS]a.2mI>)mD+he*"
SECURE_AUTH_KEY="z{t]r8Y1FEv#dUDp0PrW3V]Ud&(=K.`,Lc/`)bd*lMAR!A!DviEY/VtqB?I(_R[`"
LOGGED_IN_KEY="1JlXlM^:m/aw*LSocEK@=zjGplo0W1-2dLmBSTrHiQEa0E0GG/)Ab]mo#-0UP)0."
NONCE_KEY="CY6s*vf!|sNwL0fBBne1BW*H3_27fQ(|0GQ!`{aaMUU0y!M(9`UM>0K|F:gh,4^q"
AUTH_SALT="<ai/SQ8V4/.[p7wD|dy![BF(O&?st-5r1BlovzYRMr_)}S*sD5Fa"
SECURE_AUTH_SALT="^(@Y!|{/lumQQG}ldWT?;`A3;]P5q*v<r+skW!S0=UN&w+z*j>C:^KS)c&-oPpDW"
LOGGED_IN_SALT="2FTg7oT2zh+}gK,YrJ72h.K+om17-](IPXb}8i6C[Wqpz?t}Lgapl-UkyU]+iAPK"
NONCE_SALT="[KZd<;0bWnVh}tti(RQ!e1b9flDvX8YfceP<C4`t!-(BeXTdw"
```
8. Run `composer install`
9. You may need to restart Laragon. Click `Stop` then `Start All` again.
10. You will also need to import the database
    - Go to your server's phpMyAdmin
    - From phpMyAdmin, select your project's database on the left.
    - Then click **Export** at the top.
    - Leave _Export Method_ as "Quick". Then click the "Go" button
    - This will download the database as an SQL file.
    - Open Laragon's phpMyAdmin. Right Click Laragon > MySQL > phpMyAdmin. (if you do not have phpMyAdmin follow [these instructions](https://medium.com/ariel-mejia-dev/laragon-setup-series-part-3-add-phpmyadmin-to-laragon-faf414db463a))
       - Username: root
       - Password: _(leave blank)_
    - Click On the database on the left
    - Then click **Import**
    - Upload your SQL file, then click the "Go" button
    - After a successful import it's a good idea to update the old urls (https://livesite.come) to the new url (http://yourproject.test)
       - Click on **SQL** at the top.
       - [Paste in this SQL query](#sql-renaming-script) (with proper urls) and click "Go" button
11. Download the `web/app/uploads` folder from the server and paste/replace uploads folder in `C:laragon/www/[PROJECT NAME]/web/app/`
12. Open your IDE and create a new project from the root of your theme `C:laragon/www/[PROJECT NAME]/web/app/themes/sage`
13. From the root of your theme run `composer install`
14. If you do not have yarn, install yarn by running `npm install --global yarn`
15. Once you have yarn, run `yarn` from the theme directory to install dependencies
    - You can find out more about the Cloud Creations Sage Boilerplate here https://github.com/cloud-creations/sage
16. Finally, run `yarn build` to compile assets.
    
<br>

17. **Move onto STEP: 3 of [Project Management Workflow](#project-management-workflow)**


<br>
<br> 

## Deployment
<small>At the time this was written, deployment only works with WSL. However, you can still use Laragon for local development. See [Laragon Deployment Pre Config](#laragon-deployment-pre-config)</small>

<br>

### Set up Staging Server
You can either use the `cloudcreations.ca` server (if the client does not have a server hosted by us set up) or you can use the client's server
1. Create a new subdomain. Call it `staging` if using clients server, or `client-name` if using cloudcreations.ca server
2. Create a new database
   - In Siteground, navigate to **SITE > MySQL > Databases** and click **Create Database** button. This will generate a new database. Change label to match subdomain. Then add user to the database with all privileges. 
   <br><small>Note: Do not create a new user, use the `cloudcreations_live` user </small>
3. Open phpMyAdmin, select your newly created database, and **Import** your local development database *.sql* file<br><br>

    <small>If you need to rename your URLs, use this SQL script</small>
    ```
      UPDATE wp_options SET option_value = replace(option_value, 'http://www.oldurl', 'http://www.newurl') WHERE option_name = 'home' OR option_name = 'siteurl';
      UPDATE wp_posts SET guid = replace(guid, 'http://www.oldurl','http://www.newurl');
      UPDATE wp_posts SET post_content = replace(post_content, 'http://www.oldurl', 'http://www.newurl');
      UPDATE wp_postmeta SET meta_value = replace(meta_value,'http://www.oldurl','http://www.newurl');
    ```

4. Ensure that your Ubuntu SSH key has been added to the server by going to Siteground dashboard **Devs > SSH Key Manager**. If not follow the steps below
    1. On your WSL Ubuntu console, run `cd ~/.ssh` 
        - (if you do not have `~/.ssh` folder, run `cd ~` then `ssh-keygen -t rsa` (accept the defaults, no need for passphrase)
    2. Check if you have a file called `id_rsa.pub` by running `ls -la`
        - If you do not have `id_rsa.pub` run `ssh-keygen` (accept the defaults, no need for passphrase)
    3. run `vi id_rsa.pub` to open your ssh key
    4. Copy your entire ssh key, (`:q` to close)
    5. In the Siteground dashboard **Dev > SSH Key Manager**, Click **Import** 
        - Name: **[YOUR NAME] Ubuntu**
        - Public Key: **[PASTE YOUR KEY]**
        - Click **Import**

_** **SKIP Step 5, 6 & 7 if using cloudcreations.ca sub-domain AND Your Github SSH Keys are configured** **_

5. Ensure that an SSH Key for Github has been added to the server. If no SSH key for github:
    - In Siteground SSH Key Manager, Click **Generate**
    - Name: **Github**
    - Password: **ssh.St34lth!**
    - Click **Create**
    - Click the 3 dots on the key you just created, then click *Public Key*
    - Copy the Public Key
6. Add SSH Key to Github repo
    - In github, Go to *Repo -> Settings -> Deploy Keys*
    - Click *Add Deploy Key*
    - Title: **Siteground**
    - Key: **[PASTE PUBLIC KEY]**
    -  **Add Key**
7. Install composer
    - From a terminal, SSH into server. Run: `ssh [YOUR SSH USERNAME]@[YOUR DOMAIN] -p 18765` 
    
        <small>(Your SSH USERNAME is found at SSH Key Manager)</small>
    - From the root `cd ~` run `curl -sS https://getcomposer.org/installer | php`
    - Make sure it worked by running `composer`

<br>
<br>

### Laragon Deployment Pre Config
1. Ensure you have the following files in the root on your project: (If you do not have the following files grab them from this repo -> https://github.com/cloud-creations/bedrock)
    - `Capfile`
    - `Gemfile`
    - `config/deploy.rb`
    - `config/deploy/staging.rb`
    - `config/deploy/production.rb`
2. Update the first 2 lines of the `config/deploy.rb` file
    ```
   set :application, '[YOUR PROJECT NAME]'
   set :repo_url, 'git@github.com:cloud-creations/[YOUR PROJECT NAME].git'
   ```
3. Update line *#2* and *#3* of `config/staging.rb` or `config/production.rb` (which ever you are deploying for)
    ```
   set :deploy_to, -> { "/home/[YOUR USERNAME]/www/[YOUR SUBDOMAIN].[YOUR DOMAIN].com" }
   set :tmp_dir, "/home/[YOUR USERNAME]/www/[YOUR SUBDOMAIN].[YOUR DOMAIN].com/tmp"
   ```
   Update line *#22*
   ```
   server '[YOUR DOMAIN]', user: '[YOUR USERNAME]', port: 18765, password: 'ssh.St34lth!', roles: %w{web app db}
   ```
   Update the **composer.phar** path with your username (last line in file)
   ```
   SSHKit.config.command_map[:composer] = "/usr/bin/php /home/[YOUR USERNAME]/composer.phar"
   ```
4. Be sure to commit and push your project to your repo `git add . && git commit -m "deploy" && git push`
5. If you do not already have WSL on your machine, follow the **WSL Local Development Installation** steps 1 - 6 to install WSL
6. On WSL, run `goto_web` to move to `/mnt/c/Users/[YOUR NAME]/Sites/` directory, clone your repo here. Run `git clone git@github.com:cloud-creations/[YOUR REPO].git`
7. `cd` into project root.
8. Run `composer install`
8. `cd web/app/themes/sage` run `npm install yarn`
9. Run `yarn`, then run `yarn build`
7. _**Move onto [Deploying Project](#deploying-project)**_

<br>
<br>

### WSL Deployment Pre Config
1. Run `goto_web` to move to `/mnt/c/Users/[YOUR NAME]/Sites/` directory
2. `cd` into your project root. 
3. `ls -la` Ensure you have the following files: (If you do not have the following files grab them from this repo -> https://github.com/cloud-creations/bedrock)
    - `Capfile`
    - `Gemfile`
    - `config/deploy.rb`
    - `config/deploy/staging.rb`
    - `config/deploy/production.rb`
4. Update the first 2 lines of the `config/deploy.rb` file
    ```
   set :application, '[YOUR PROJECT NAME]'
   set :repo_url, 'git@github.com:cloud-creations/[YOUR PROJECT NAME].git'
   ```
5. Update line *#2* and *#3* of `config/staging.rb` or `config/production.rb` (which ever you are deploying for)
    ```
   set :deploy_to, -> { "/home/[YOUR USERNAME]/www/[YOUR SUBDOMAIN].[YOUR DOMAIN].com" }
   set :tmp_dir, "/home/[YOUR USERNAME]/www/[YOUR SUBDOMAIN].[YOUR DOMAIN].com/tmp"
   ```
   Update line *#22*
   ```
   server '[YOUR DOMAIN]', user: '[YOUR USERNAME]', port: 18765, password: 'ssh.St34lth!', roles: %w{web app db}
   ```
   Update the **composer.phar** path with your username (last line in file)
   ```
   SSHKit.config.command_map[:composer] = "/usr/bin/php /home/[YOUR USERNAME]/composer.phar"
   ```
6. Go back to the root of your project `goto_web` `cd [YOUR PROJECT]`
7. Be sure to commit and push your project to your repo `git add . && git commit -m "deploy" && git push`
8. _**Move onto [Deploying Project](#deploying-project)**_

<br>
<br>

## Deploying Project
**These instructions are for first time deployment**
1. In WSL, From your project root, run `gem install bundler` to install Bundler. (try `sudo gem install bundler` if you get permission error)
2. Run `bundle install` to install Capistrano and other dependencies.
3. Run `cap staging deploy` to deploy staging or `cap production deploy` to deploy production.
    - You will get an error `.env does not exist`
    - You will need to add a `.env` file to `[SERVER PROJECT ROOT]/shared/.env` on the server.
    - You will also need to add a `.htaccess` file to `[SERVER PROJECT ROOT]/shared/web/.htaccess` on the server
    - You can add these files using the File Manager on siteground or SSH into the server via `ssh [YOUR SSH USERNAME]@[YOUR DOMAIN] -p 18765`
    - Make sure these files have the proper credentials. You can view a sample of each file at this repo -> https://github.com/cloud-creations/bedrock
    - Run `cap staging deploy` or `cap production deploy` again
4. You will need to Symlink `current/web` to `public_html`
    - SSH into server. run `ssh [YOUR SSH USERNAME]@[YOUR DOMAIN] -p 18765` Find these credentials in the SSH Key Manager
    - `cd www/[YOUR DOMAIN / SUB DOMAIN]`
    - Rename the `public_html` directory. Run `mv public_html _public_html`
    - Create the symlink. Run `ln -s current/web public_html`
5. Deploy does not upload the `web/app/uploads` folder to the server. You will have to manually add your uploads.
    - Zip up your local `web/app/uploads` directory to `uploads.zip`
    - upload `uploads.zip` to your server @ `../shared/web/app/`
    - Unzip `uploads.zip` and replace the current `uploads` directory
6. You will also need to upload your database for the first time.
   - Open Laragon's phpMyAdmin. Right Click Laragon > MySQL > phpMyAdmin. (if you do not have phpMyAdmin follow [these instructions](https://medium.com/ariel-mejia-dev/laragon-setup-series-part-3-add-phpmyadmin-to-laragon-faf414db463a))
     - Username: root
     - Password: _(leave blank)_
   - From phpMyAdmin, select your project's database on the left.
   - Then click **Export** at the top. 
   - Leave _Export Method_ as "Quick". Then click the "Go" button
   - This will download the database as an SQL file.
   - Go to your servers phpMyAdmin
   - Click On the database on the left
   - Then click **Import**
   - Upload your SQL file, then click the "Go" button
   - After a successful import it's a good idea to update the old urls (http://yourproject.test) to the new url (https://livesite.com) 
     - Click on **SQL** at the top.
     - [Paste in this SQL query](#sql-renaming-script) (with proper urls) and click "Go" button
7. Siteground uses a cache so you will probably need to flush the cache to see your changes. *Siteground -> Speed -> Caching*
    - Go to the Dynamic Caching tap
    - Click the broom icon to clear cache

<br>
<br>

## Project Management Workflow
Follow these steps to ensure the smoothest work flow:
1. Using WP Synchro in the WordPress dashboard of your dev site (yoursite.test), Sync your dev database with the production/staging database (pull from production/staging to dev)
2. Download production/staging `shared/web/app/uploads` directory from server and replace local dev's `web/app/uploads`.

    <br>
3. ### Make the changes/updates to the local dev project....
    <br>

4. Once changes are completed and ready to deploy, Commit and Push changes to repo
   - `git add . && git commit -m "updates" && git push`
5. If using **Laragon** for local dev:
   - Open our WSL terminal. 
   - Go to project root `goto_web` `cd [PROJECT]`
   - Run `git pull` on WSL project root so that your WSL has your lasted updates and is ready to deploy.
6. From WSL, go to your project `goto_web` `cd [PROJECT]` and Run: `cap staging deploy` to deploy updates to staging site for review.
7. Use WP Synchro in the WordPress dashboard of your dev site (yoursite.test), Sync the staging database with your dev database (push to staging from dev)
8. Upload your `web/app/uploads` folder to staging server if necessary. (only needed if you've uploaded new images or files in the WordPress dashboard) 

#### Deploy to Production
- After review and approval of the staging site, from WSL run: `cap production deploy` to deploy updates to production site.
- Upload your `web/app/uploads` to production server if necessary. (only needed if you've uploaded new images or files in the WordPress dashboard)
- Use WP Synchro to Sync the production database with your dev database (push to production from dev)

<br>
<br>

## WordPress Plugins
Bedrock use's composer to install Plugins. The `composer.json` included in this repo contains the requires for commonly used plugins. 
Therefore, do not install plugins via the WordPress dashboard, instead follow the steps below.

To install plugins on your Wordpress Bedrock site:
- Find your plugin in the WordPress.org plugin library ie. https://wordpress.org/plugins/classic-editor/
- Search your plugin's slug at https://wpackagist.org/ ie. `classic-editor`
- You can check if it's the correct WordPress Plugin by clicking the name. This will open its WordPress.org page
- Click the version number you want to install.
- Copy the require script ie. `"wpackagist-plugin/contact-form-7":"5.4.1"`
- Paste in your project's *root* `composer.json` file. Example:
     ```
     "require": {
         "wpackagist-plugin/contact-form-7":"5.4.1",
         [YOUR PACKAGE HERE]
     }
     ```
- Then in your terminal from the root of your project, run: `composer install`
 
Note: To always pull in the latest version of a plugin on `composer install`, add the `^` to the front of the version number in the json. Example:

    "wpackagist-plugin/contact-form-7":"^5.4.1",
<br>
<br>

## Some Useful Console Commands:
- `ls -la` List items in directory, can also use `ls`
- `cd` change directory. followed with the directory name ie. `cd foobar`.
    - `../` takes you up a level ie. `cd ../`
    - `cd ~` take you to the root directory
- `mkdir` makes a new directory ie. `mkdir foobar`
- `mv /home/user/oldname /home/user/newname` to move or rename directory
- `rm -rf` removes a directory or file ie. `rm -rf foobar`
- `touch` will create a new file ie. `touch foo.bar`
- `sudo` appending a command with `sudo` will give you super user permission. Usefull if you get a permission denied error.
- `vi` allows you to edit a file ie. `vi foo.bar`
    - You can edit the file by pressing the `Ins` key or `i`
    - Press `Esc` to stop editing
    - use `:w` to write/save `:q` to quit/exit or `:wq` to write and quit.
- `ln -s [orginal directory] [linked directory]` creates a symlink ie. `ln -s current/web public_html`
- `Tab` to auto-complete your commands
- `Arrow Down & Arrow Down` Recent commands / Command History
- `clear` to clear your terminal
- `exit` to exit an SSH session

<br>
<br>

## SQL Renaming Script
```
   UPDATE wp_options SET option_value = replace(option_value, 'http://www.oldurl', 'http://www.newurl') WHERE option_name = 'home' OR option_name = 'siteurl';
   UPDATE wp_posts SET guid = replace(guid, 'http://www.oldurl','http://www.newurl');
   UPDATE wp_posts SET post_content = replace(post_content, 'http://www.oldurl', 'http://www.newurl');
   UPDATE wp_postmeta SET meta_value = replace(meta_value,'http://www.oldurl','http://www.newurl');
 ```
    

