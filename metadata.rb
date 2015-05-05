name             "phpqatools"
maintainer_email "thomas.liebscher@iconicfuture.com"
maintainer       "Thomas Liebscher"
license          "Apache 2.0"
description      "Installs phpunit, phploc, phpdpd, phpmd, phpdoc, phpcs"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.1.0"

depends "php"
depends "graphViz"

%w{ ubuntu debian }.each do |os|
  supports os
end
