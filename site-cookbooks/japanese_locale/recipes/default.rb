#
# Cookbook Name:: japanese_locale
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "language-pack-ja" do

  action :install

end

bash "reconfigure locale" do

  code <<-EOC
    dpkg-reconfigure locales
    update-locale LANG=ja_JP.UTF8
  EOC

end

link "/etc/localtime" do

  to "/usr/share/zoneinfo/Asia/Tokyo"

end

