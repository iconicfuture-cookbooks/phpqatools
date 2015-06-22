#
# Cookbook Name:: phpqatools
# Recipe:: phpdocumentor
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
# Install phpmd
#

execute "PHP QA Tools - download source for 'phpDocumentor'" do
  command "wget http://www.phpdoc.org/phpDocumentor.phar"
  not_if do
    File.exists?("/var/log/if-phpdocumentor-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x phpDocumentor.phar"
  not_if do
    File.exists?("/var/log/if-phpdocumentor-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/phpDocumentor'" do
  command "mv phpDocumentor.phar /usr/local/bin/phpDocumentor"
  not_if do
    File.exists?("/var/log/if-phpdocumentor-installed")
  end
  user "root"
  action :run
end

#
# Set lock file to prevent repeat setup
#

execute "PHP QA Tools - set phpDocumentor installation done lock file" do
  command "touch /var/log/if-phpdocumentor-installed"
  not_if do
    File.exists?("/var/log/if-phpdocumentor-installed")
  end
  user "root"
  action :run
end
