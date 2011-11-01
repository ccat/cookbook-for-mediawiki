#
# Cookbook Name:: mediawiki
# Recipe:: backup
#
# Copyright 2011, ccat
#

template "/etc/cron."+node[:mediawiki][:backup_frequency]+"/mediawiki_backup_script" do
 source "backup_script.erb"
 owner "root"
 group "root"
 mode "0750"
end

directory node[:mediawiki][:backup_folder] do
 owner "root"
 group "root"
 mode "0750"
 recursive true
end



