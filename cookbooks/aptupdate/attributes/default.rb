case node["platform_family"]
#case node["platform"]
when "debian"
#when "ubuntu"
  default["command_use"] = "apt-get"
when "rhel"
#when "centos"
  default["command_use"] = "yum -y"
end
