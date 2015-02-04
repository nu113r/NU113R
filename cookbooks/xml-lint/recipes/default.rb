#
# Cookbook Name:: xml-lint
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node["platform_family"]
when "debian"
  package 'libxml2-utils'
when "rhel"
  include_recipe "libxml2"
end
