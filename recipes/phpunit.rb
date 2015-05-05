#
# Cookbook Name:: phpqatools
# Recipe:: phpunit
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# install php prerequisites
include_recipe "phpqatools::prerequisites"

#
# Install phpunit
#

execute "PHP QA Tools - download source for 'phpunit'" do
  command "wget https://phar.phpunit.de/phpunit.phar"
  not_if do
    File.exists?("/var/log/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x phpunit.phar"
  not_if do
    File.exists?("/var/log/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/phpunit'" do
  command "mv phpunit.phar /usr/local/bin/phpunit"
  not_if do
    File.exists?("/var/log/if-phpunit-installed")
  end
  user "root"
  action :run
end

#
# Set lock file to prevent repeat setup
#

execute "PHP QA Tools - set phpunit installation done lock file" do
  command "touch /var/log/if-phpunit-installed"
  not_if do
    File.exists?("/var/log/if-phpunit-installed")
  end
  user "root"
  action :run
end
