#
# Cookbook Name:: phpstorm
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'java' 
src_filename = ::File.basename(node['storm']['url'])
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "#{node['storm']['dir']}"

remote_file src_filepath do
  source node['storm']['url']
  action :create_if_missing
end

bash 'unpack_storm' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    mkdir -p #{extract_path}
    tar xzf #{src_filename} -C #{extract_path} --strip 1
  EOH
  not_if { ::File.exist?(extract_path) }
end
