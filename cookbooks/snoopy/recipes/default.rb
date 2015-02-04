#
# Cookbook Name:: snoopy
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'wget'
execute 'snoopy_install' do
	cwd '/root'
	command "wget -q -O - https://github.com/a2o/snoopy/raw/master/bin/snoopy-install.sh | sh"
end
