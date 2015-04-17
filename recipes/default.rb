package "phpunit"

#
# Install xsl and xdebug
#

execute "PHP QA Tools - install package dependencies" do
  command "apt-get -y install php5-xsl php5-xdebug"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

#
# Install phpunit
#

execute "PHP QA Tools - download source for 'phpunit'" do
  command "wget https://phar.phpunit.de/phpunit.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x phpunit.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/phpunit'" do
  command "mv phpunit.phar /usr/local/bin/phpunit"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

#
# Install phploc
#

execute "PHP QA Tools - download source for 'phploc'" do
  command "wget https://phar.phpunit.de/phploc.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x phploc.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/phploc'" do
  command "mv phploc.phar /usr/local/bin/phploc"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

#
# Install phpcpd
#

execute "PHP QA Tools - download source for 'phpcpd'" do
  command "wget https://phar.phpunit.de/phpcpd.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x phpcpd.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/phpcpd'" do
  command "mv phpcpd.phar /usr/local/bin/phpcpd"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

#
# Install phpdox
#

execute "PHP QA Tools - download source for 'phpdox'" do
  command "wget http://phpdox.de/releases/phpdox.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x phpdox.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/phpdox'" do
  command "mv phpdox.phar /usr/local/bin/phpdox"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

#
# Install pdepend
#

execute "PHP QA Tools - download source for 'pdepend'" do
  command "wget http://static.pdepend.org/php/latest/pdepend.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x pdepend.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/pdepend'" do
  command "mv pdepend.phar /usr/local/bin/pdepend"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

#
# Install phpmd
#

execute "PHP QA Tools - download source for 'phpmd'" do
  command "wget http://static.phpmd.org/php/2.1.3/phpmd.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x phpmd.phar"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/phpmd'" do
  command "mv phpmd.phar /usr/local/bin/phpmd"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

#
# Install PHP_CodeSniffer
#

execute "PHP QA Tools - pear install PHP_CodeSniffer" do
  command "pear install PHP_CodeSniffer"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

#
# Install PHPdocumentor
#

execute "PHP QA Tools - pear channel-discover pear.phpdoc.org" do
  command "pear channel-discover pear.phpdoc.org"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - pear install phpdoc/phpDocumentor" do
  command "pear install phpdoc/phpDocumentor"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end

#
# Set lock file to prevent repeat setup
#

execute "PHP QA Tools - set installation done lock file" do
  command "touch /var/opt/if-phpunit-installed"
  not_if do
    File.exists?("/var/opt/if-phpunit-installed")
  end
  user "root"
  action :run
end
