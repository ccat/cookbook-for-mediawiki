#
# Cookbook Name:: mediawiki
# Recipe:: default
#
# Copyright 2011, ccat
#

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
include_recipe "mysql::client"

node.set_unless[:mediawiki][:dbpass] = secure_password
node.set_unless[:mediawiki][:dbAdminPass] = secure_password

template "/tmp/set_pass.sql" do
 source "set_pass.sql.erb"
 owner "root"
 group "root"
 mode "0750"
 not_if do File.exists?(node[:mediawiki][:directory]) end
end

script "set_mediawiki" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  not_if do File.exists?(node[:mediawiki][:directory]) end
  code <<-EOH
  wget http://download.wikimedia.org/mediawiki/1.17/mediawiki-1.17.0.tar.gz
  tar -zxf mediawiki-1.17.0.tar.gz
  mv mediawiki-1.17.0 #{node[:mediawiki][:directory]}
  chown -R apache:apache #{node[:mediawiki][:directory]}
  cd #{node[:mediawiki][:directory]}
  php maintenance/install.php --dbname #{node[:mediawiki][:dbname]} --dbpass #{node[:mediawiki][:dbpass]}  --dbserver #{node[:mediawiki][:dbserver]} --dbuser #{node[:mediawiki][:dbuser]} --installdbpass #{node[:mediawiki][:installdbPass]}  --pass #{node[:mediawiki][:dbAdminPass]} --installdbuser root --lang #{node[:mediawiki][:lang]}  #{node[:mediawiki][:sitename]} #{node[:mediawiki][:dbAdminUser]}
  mysql -u root -p#{node[:mediawiki][:installdbPass]} < /tmp/set_pass.sql
  mv LocalSettings.php LocalSettings_autogenerate.php
  sed -e "s/maintenance\\/install.php/#{node[:mediawiki][:url]}/g" LocalSettings_autogenerate.php > LocalSettings_temp.php
  sed -e "/\\$wgEmergencyContact/D" LocalSettings_temp.php > LocalSettings_temp2.php
  sed -e "/\\$wgPasswordSender/D" LocalSettings_temp2.php > LocalSettings.php
  echo "\\$wgEmergencyContact = \\"#{node[:mediawiki][:email]}\\";" >> LocalSettings.php
  echo "\\$wgPasswordSender = \\"#{node[:mediawiki][:email]}\\";" >> LocalSettings.php
  rm -rf LocalSettings_temp.php
  rm -rf LocalSettings_temp2.php
  EOH
end




