#
# Cookbook Name:: cutom_mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'git'
mysql_service 'default' do
  port '3306'
  initial_root_password 'password'
  action [:create, :start]
end

link '/etc/init.d/mysql-default' do
  to '/lib/init/upstart-job'
end

mysql_database 'test' do
  connection(
    :host     => '127.0.0.1',
    :username => 'root',
    :password => node['mysql']['server_root_password']
  )
  action :create
end
