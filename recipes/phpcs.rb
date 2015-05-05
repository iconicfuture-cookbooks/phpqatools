#
# Cookbook Name:: phpqatools
# Recipe:: phpcs
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

#
# Install PHP_CodeSniffer
#

execute "PHP QA Tools - download source for 'phpcs'" do
  command "wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar"
  not_if do
    File.exists?("/var/log/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x phpcs.phar"
  not_if do
    File.exists?("/var/log/if-phpunit-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/phpcs'" do
  command "mv phpcs.phar /usr/local/bin/phpcs"
  not_if do
    File.exists?("/var/log/if-phpunit-installed")
  end
  user "root"
  action :run
end

