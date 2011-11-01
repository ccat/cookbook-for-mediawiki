#
# Cookbook Name:: mediawiki
# Attributes:: default
#
# Copyright 2011, ccat

default[:mediawiki][:sitename] = "mediawiki"
default[:mediawiki][:directory] = "/var/www/mediawiki"
default[:mediawiki][:url] = "\\/mediawiki"
default[:mediawiki][:dbtype] = "mysql"
default[:mediawiki][:dbserver] = "localhost"
default[:mediawiki][:dbname] = "mediawiki"
default[:mediawiki][:dbAdminUser] = "admin"
default[:mediawiki][:installdbPass] = node[:mysql][:server_root_password]
default[:mediawiki][:dbAdminPass] = ""
default[:mediawiki][:dbuser] = "mediawiki"
default[:mediawiki][:dbpass] = ""
default[:mediawiki][:lang] = "en"
default[:mediawiki][:email] = "root@localhost"
default[:mediawiki][:backup_folder] ="/var/backup/mediawiki/"
#default[:mediawiki][:backup_frequency] ="hourly"
#default[:mediawiki][:backup_frequency] ="daily"
default[:mediawiki][:backup_frequency] ="weekly"
#default[:mediawiki][:backup_frequency] ="monthly"

