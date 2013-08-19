# --- Install packages we need ---
package 'php5-fpm'
package 'php5'
package 'php5-cli'
package 'php-pear'
package 'phpunit'

execute "phpunit" do
    command "pear upgrade pear"
    command "pear channel-discover pear.phpunit.de"
    command "pear channel-discover components.ez.no"
    command "pear install --alldeps phpunit/PHPUnit"
end

execute "start-php5-fpm" do
  command "/etc/init.d/php5-fpm start"
end
