#
# Cookbook Name:: aptupdate
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "update" do
   command "#{node["command_use"]} update"
end
