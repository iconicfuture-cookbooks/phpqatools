#
# Cookbook Name:: phpqatools
# Recipe:: phpmd
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

include_recipe "phpqatools::pdepend"

#
# Install phpmd
#

execute "PHP QA Tools - download source for 'phpmd'" do
  command "wget http://static.phpmd.org/php/2.1.3/phpmd.phar"
  not_if do
    File.exists?("/var/log/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x phpmd.phar"
  not_if do
    File.exists?("/var/log/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/phpmd'" do
  command "mv phpmd.phar /usr/local/bin/phpmd"
  not_if do
    File.exists?("/var/log/if-phpunit-installed")
  end
  user "root"
  action :run
end

#
# Set lock file to prevent repeat setup
#

execute "PHP QA Tools - set phpmd installation done lock file" do
  command "touch /var/log/if-phpmd-installed"
  not_if do
    File.exists?("/var/log/if-phpmd-installed")
  end
  user "root"
  action :run
end
