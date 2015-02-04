default["xml1"] = File.join(Chef::Config[:file_cache_path], 'SBconfig.xml')
default["xml2"] = File.join(Chef::Config[:file_cache_path], 'CBconfig.xml')
default["xml3"] = File.join(Chef::Config[:file_cache_path], 'MSFconfig.xml')
default["xml4"] = File.join(Chef::Config[:file_cache_path], 'RSBconfig.xml')
default["xml5"] = File.join(Chef::Config[:file_cache_path], 'MSTconfig.xml')
default['java']['jdk_version'] = '7'
default['java']['set_etc_environment'] = true
