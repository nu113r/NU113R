#
# Cookbook Name:: custom_vnc
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'vnc::server'
package 'expect'
directory "/root/.vnc" do
  owner 'root'
  group 'root'
  action :create
end

case node["platform_family"]
when "debian"
  template '/root/.vnc/xstartup' do
    source 'xstartup.erb'
    mode '0755'
    owner 'root'
    group 'root'
  end
when "rhel"
  template '/root/.vnc/xstartup' do
    source 'xstartupcentos.erb'
    mode '0755'
    owner 'root'
    group 'root'
  end
end

cookbook_file "gnome-keybindings.pl" do
  path "/usr/local/etc/gnome-keybindings.pl"
  mode '0755'
  action :create_if_missing
end
cookbook_file "gnome-docker-fix-and-customise.sh" do
  path "/usr/local/etc/gnome-docker-fix-and-customise.sh"
  mode '0755'
  action :create_if_missing
end
cookbook_file "spawn-desktop.sh" do
  path "/usr/local/etc/spawn-desktop.sh"
  mode '0755'
  action :create_if_missing
end
cookbook_file "start-vnc-expect-script.sh" do
  path "/usr/local/etc/start-vnc-expect-script.sh"
  mode '0755'
  action :create_if_missing
end
cookbook_file "passwd" do
  path "/root/.vnc/passwd"
  mode '0600'
  action :create_if_missing
end

execute 'start_vnc' do
  command "/usr/local/etc/spawn-desktop.sh"
  only_if { ::Dir.glob("/root/.vnc/*.pid").empty? }
# not_if { ::File.exists?("/root/.vnc/adc816125a12:1.pid")}
end
