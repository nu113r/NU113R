#
# Cookbook Name:: custom_percona
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "percona::package_repo"
package 'qpress'
include_recipe 'percona::backup'
include_recipe 'percona::cluster'
