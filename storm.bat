@START
rm -rf .env
touch .env
echo DB_NAME='%1'>>.env
echo DB_USER='root'>>.env
echo DB_PASSWORD=''>>.env
echo DB_HOST='localhost'>>.env
echo DB_PREFIX='wp_'>>.env
echo WP_ENV='development'>>.env
echo WP_HOME='http://%1.test'>>.env
echo WP_SITEURL="${WP_HOME}/wp">>.env
echo WP_DEBUG_LOG=/path/to/debug.log>>.env
echo AUTH_KEY="&sy&jkot]%Q[Ho=S7g9,0[pAg:VU,k{>@O@,iqm8+7eXk6[DwS]a.2mI>)mD+he*">>.env
echo SECURE_AUTH_KEY="z{t]r8Y1FEv#dUDp0PrW3V]Ud&(=K.`,Lc/`)bd*lMAR!A!DviEY/VtqB?I(_R[`">>.env
echo LOGGED_IN_KEY="1JlXlM^:m/aw*LSocEK@=zjGplo0W1-2dLmBSTrHiQEa0E0GG/)Ab]mo#-0UP)0.">>.env
echo NONCE_KEY="CY6s*vf!|sNwL0fBBne1BW*H3_27fQ(|0GQ!`{aaMUU0y!M(9`UM>0K|F:gh,4^q">>.env
echo AUTH_SALT="<ai/SQ8V4/.[p7wD|dy![BF(O&?st-5r1BlovzYRMr_)}S*%UD,<IvIcBg:sD5Fa">>.env
echo SECURE_AUTH_SALT="^(@Y!|{/lumQQG}ldWT?;`A3;]P5q*v<r+skW!S0=UN&w+z*j>C:^KS)c&-oPpDW">>.env
echo LOGGED_IN_SALT="2FTg7oT2zh+}gK,YrJ72h.K+om17-](IPXb}8i6C[Wqpz?t}Lgapl-UkyU]+iAPK">>.env
echo NONCE_SALT="[KZd<%Bv_FQ}w$q0Y*:;0bWnVh}tti(RQ!e1b9flDvX8YfceP<C4`t%!-(BeXTdw">>.env

rm -rf composer.json
rm -rf composer.lock
git clone git@github.com:cloud-creations/bedrock.git
rm -rf composer.lock
rm -rf .git
rm -rf .env-example
rm -rf .htaccess-example
rm -rf stealth.bat
cp bedrock/composer.json composer.json
rm -rf bedrock

call composer install

cd web/app/
rm -rf themes
mkdir themes

cd themes
call git clone git@github.com:cloud-creations/sage.git
cd sage
rm -rf .git
rm -rf .github
cd resources
call git clone git@github.com:cloud-creations/component_library.git
cd ../
call npm install --global yarn
call yarn
phpstorm.bat .