#
# Cookbook Name:: sahi
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'java'
package 'zip'
package 'unzip'
src_filename = ::File.basename(node['sahi']['url'])
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "#{node['sahi']['dir']}"

remote_file src_filepath do
  source node['sahi']['url']
  action :create_if_missing
end

bash 'unpack_sahi' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    mkdir -p #{extract_path}
    unzip #{src_filename} -d #{extract_path}
    chmod +x #{extract_path}/sahi/bin/sahi.sh
  EOH
  not_if { ::File.exist?(extract_path) }
end
