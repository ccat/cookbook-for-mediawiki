#
# Cookbook Name:: mediawiki
# Recipe:: restore
#
# Copyright 2011, ccat
#

script "restore_mediawiki" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  only_if do File.exists?(node[:mediawiki][:directory]+"/backup.sql") end
  code <<-EOH
  mysql -u #{node[:mediawiki][:dbuser]} -p#{node[:mediawiki][:dbpass]} #{node[:mediawiki][:dbname]} < #{node[:mediawiki][:directory]}/backup.sql
  rm -f  #{node[:mediawiki][:directory]}/backup.sql
  EOH
end




