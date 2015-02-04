#
# Cookbook Name:: cookbook-test
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
group "system-admins" do
                gid 1001
        end
	user "mohit" do
		comment "Mohit User"
		shell "/bin/bash"
		home "/home/mohit"
		gid "system-admins"
		uid 1002
		supports :manage_home => true
		password "$1$loIvZQ46$OJJe0QjbN.owLsSYphEOh0"
	end
