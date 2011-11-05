#
# Cookbook Name:: mediawiki
# Attributes:: default
#
# Copyright 2011, ccat

default[:mediawiki][:directory] = "/var/www/mediawiki"

default[:mediawiki][:wgSitename] = "mediawiki"
default[:mediawiki][:wgMetaNamespace] = "Mediawiki" # Link to wgSitename
default[:mediawiki][:wgScriptPath] = "mediawiki"
default[:mediawiki][:wgScriptExtension] = ".php"
default[:mediawiki][:wgStylePath] = "$wgScriptPath/skins"
default[:mediawiki][:wgLogo] = "$wgStylePath/common/images/wiki.png"
default[:mediawiki][:wgEnableEmail] = "true"
default[:mediawiki][:wgEnableUserEmail] = "true"
default[:mediawiki][:wgEmergencyContact] = "root@localhost"
default[:mediawiki][:wgPasswordSender] = "root@localhost"
default[:mediawiki][:wgEnotifUserTalk] = "false"
default[:mediawiki][:wgEnotifWatchlist] = "false"
default[:mediawiki][:wgEmailAuthentication] = "true"
default[:mediawiki][:wgDBtype] = "mysql"
default[:mediawiki][:wgDBserver] = "localhost"
default[:mediawiki][:wgDBname] = "mediawiki"
default[:mediawiki][:wgDBuser] = "mediawiki"
default[:mediawiki][:wgDBpassword] = ""
default[:mediawiki][:wgMainCacheType] = "CACHE_NONE"
default[:mediawiki][:wgMemCachedServers] = "array()"
default[:mediawiki][:wgEnableUploads] = "false"
default[:mediawiki][:wgUseImageMagick] = "false"
default[:mediawiki][:wgImageMagickConvertCommand] = "/usr/bin/convert"
default[:mediawiki][:wgUseInstantCommons] = "false"
default[:mediawiki][:wgShellLocale] = "en_US.utf8"
default[:mediawiki][:wgUseTeX] = "false"
default[:mediawiki][:wgLanguageCode] = "en"
default[:mediawiki][:wgSecretKey] = ""
default[:mediawiki][:wgUpgradeKey] = ""
default[:mediawiki][:wgDefaultSkin] = "vector"
default[:mediawiki][:wgEnableCreativeCommonsRdf] = "false"
default[:mediawiki][:wgRightsPage] = ""
default[:mediawiki][:wgRightsUrl] = ""
default[:mediawiki][:wgRightsText] = ""
default[:mediawiki][:wgRightsIcon] = ""
default[:mediawiki][:wgDiff3] = "/usr/bin/diff3"
default[:mediawiki][:wgResourceLoaderMaxQueryLength] = "-1"

default[:mediawiki][:dbAdminUser] = "admin"
default[:mediawiki][:installdbPass] = node[:mysql][:server_root_password]
default[:mediawiki][:dbAdminPass] = ""

default[:mediawiki][:backup_folder] ="/var/backup/mediawiki"
#default[:mediawiki][:backup_frequency] ="hourly"
#default[:mediawiki][:backup_frequency] ="daily"
default[:mediawiki][:backup_frequency] ="weekly"
#default[:mediawiki][:backup_frequency] ="monthly"

