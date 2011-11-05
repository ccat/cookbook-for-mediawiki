#
# Cookbook Name:: mediawiki
# Recipe:: restore
#
# Copyright 2011, ccat
#

script "restore_mediawiki_by_sql" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  only_if do File.exists?(node[:mediawiki][:directory]+"/backup.sql") end
  code <<-EOH
  mysql -u #{node[:mediawiki][:dbuser]} -p#{node[:mediawiki][:dbpass]} #{node[:mediawiki][:dbname]} < #{node[:mediawiki][:directory]}/backup.sql
  rm -f  #{node[:mediawiki][:directory]}/backup.sql
  EOH
end

script "restore_mediawiki_by_tar_gz" do
  interpreter "bash"
  user "root"
  cwd node[:mediawiki][:directory]
  only_if do File.exists?(node[:mediawiki][:directory]+"/backup.tar.gz") end
  code <<-EOH
  cd #{node[:mediawiki][:directory]}
  tar xvzf backup.tar.gz
  php maintenance/importDump.php backup.xml
  php maintenance/rebuildrecentchanges.php
  rm -rf backup.xml
  rm -rf backup.tar.gz
  EOH
end




