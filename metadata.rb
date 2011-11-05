maintainer       "ccat"
maintainer_email "deadlack@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures/backups/restores mediawiki"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "1.0.0"

depends "mysql"
depends "php"
depends "apache2"

recipe "mediawiki","Install mediawiki"
recipe "mediawiki::backup","Backup mediawiki by using cron"
recipe "mediawiki::restore","Restore mediawiki by backuped file"
