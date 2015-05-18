#
# Cookbook Name:: phpqatools
# Recipe:: phploc
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
# Install phploc
#

execute "PHP QA Tools - download source for 'phploc'" do
  command "wget https://phar.phpunit.de/phploc.phar"
  not_if do
    File.exists?("/var/log/if-phploc-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x phploc.phar"
  not_if do
    File.exists?("/var/log/if-phploc-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/phploc'" do
  command "mv phploc.phar /usr/local/bin/phploc"
  not_if do
    File.exists?("/var/log/if-phploc-installed")
  end
  user "root"
  action :run
end

#
# Set lock file to prevent repeat setup
#

execute "PHP QA Tools - set phploc installation done lock file" do
  command "touch /var/log/if-phploc-installed"
  not_if do
    File.exists?("/var/log/if-phploc-installed")
  end
  user "root"
  action :run
end
