#
# Cookbook Name:: custom_percona
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apt'
apt_repository "percona" do
  uri node["percona"]["apt_uri"]
  distribution node["lsb"]["codename"]
  components ["main"]
  keyserver node["percona"]["apt_keyserver"]
  key node["percona"]["apt_key"]
  action :add
end
include_recipe 'apt'
%w( percona-xtradb-cluster-56 qpress xtrabackup python-software-properties vim wget curl netcat ).each do |package_name|
  package package_name
end
template "/etc/my.cnf" do
  source "my.cnf.erb"
  variables(
       :node_address => node["percona"]["node"]["address"],
       :cluster_address => node["percona"]["cluster"]["address"],
       :node_name => node["percona"]["node"]["name"],
       :cluster_name => node["percona"]["cluster"]["name"]
  )
end
template "/etc/mysql/my.cnf" do
  source "my.cnf.erb"
  variables(
       :node_address => node["percona"]["node"]["address"],
       :cluster_address => node["percona"]["cluster"]["address"],
       :node_name => node["percona"]["node"]["name"],
       :cluster_name => node["percona"]["cluster"]["name"]
  )
end
case node["percona"]["bootstrap"]
when true
  bash "create_auth_user" do
    code <<-EOH
      /etc/init.d/mysql bootstrap-pxc
      mysql -e "GRANT RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'sst'@'localhost' IDENTIFIED BY 'secret';"
    EOH
  end
when false
  service 'mysql' do
    action :start
  end
end
