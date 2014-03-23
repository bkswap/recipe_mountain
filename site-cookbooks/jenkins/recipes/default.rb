#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "daemon" do

  action :install

end

package "jenkins" do

  action :install

end

service "jenkins" do

  supports :status => true, :restart => true, :reload=>true
  action [ :enable, :start ]

end

template "jenkins" do

  path "/etc/default/jenkins"
  source "jenkins.erb"
  owner "root"
  group "root"
  mode 0644

  notifies :restart, 'service[jenkins]'

end

template "cli.conf" do

  path "/etc/jenkins/cli.conf"

  source "cli.conf.erb"
  owner "root"
  group "root"
  mode 0644

  notifies :restart, 'service[jenkins]'

end

