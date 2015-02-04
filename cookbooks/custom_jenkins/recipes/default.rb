#
# Cookbook Name:: custom_jenkins
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "java"
include_recipe "jenkins::master"

%w( envinject email-ext email-ext-recipients-column credentials conditional-buildstep build-blocker-plugin authorize-project ant matrix-auth mailer junit jobgenerator javadoc htmlpublisher groovy-postbuild github github-api git git-client any-buildstep flexible-publish xunit translation token-macro subversion script-realm script-security scm-api run-condition plot parameterized-trigger pam-auth antisamy-markup-formatter jenkins-multijob-plugin external-monitor-job maven-plugin ).each do |plugins|
  jenkins_plugin plugins
end

jenkins_user 'mohit' do
  full_name    'Mohit Belwal'
  email        'belwal.mohit@gmail.com'
end

template node["xml1"] do
  source 'SBconfig.xml.erb'
end

template node["xml2"] do
  source 'CBconfig.xml.erb'
end

template node["xml3"] do
  source 'MSFconfig.xml.erb'
end

template node["xml4"] do
  source 'RSBconfig.xml.erb'
end

template node["xml5"] do
  source 'MSTconfig.xml.erb'
end

jenkins_job 'SetupFeatureBranch' do
  config node["xml1"]
end

jenkins_job 'clear_feature_branch' do
  config node["xml2"]
end

jenkins_job 'merge_master_to_feature' do
  config node["xml3"]
end

jenkins_job 'merge_source_target' do
  config node["xml5"]
end

jenkins_job 'Run_SetupFeatureBranch' do
  config node["xml4"]
end
