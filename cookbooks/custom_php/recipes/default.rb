#
# Cookbook Name:: custom_php
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
php_pear "memcache" do
  action :install
end
php_pear "xdebug" do
  # Specify that xdebug.so must be loaded as a zend extension
  zend_extensions ['xdebug.so']
  action :install
end
package 'gcc'
package 'make'
package 'vim'
package 'wget'
package 'curl'
case node["platform_family"]
when "debian"
  package "php-apc" do
    action :install
  end
  package 'drush'
  package 'php5-fpm'
  package 'php5-mysql'
  package 'php5-gd'
  package 'php5-curl'
when "rhel"
  package 'httpd-devel'
  package 'pcre-devel'
  php_pear "apc" do
    action :install
  end
  php_pear_channel "pear.drush.org" do
    action [:discover, :add]
  end
  execute 'install_drush' do
    command "pear install drush/drush"
    only_if { ::Dir.glob("/tmp/pear/download/drush*.tgz").empty? }
  end
  package 'php-fpm'
  package 'php-mysql'
  package 'php-gd'
  package 'php-curl'
end

case node["platform_family"]
when "debian"
  service 'php5-fpm' do
    action [:start, :enable]
  end
when "rhel"
  service 'php-fpm' do
    action [:start, :enable]
  end
end
