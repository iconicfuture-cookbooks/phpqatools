#
# Cookbook Name:: phpqatools
# Recipe:: pdepend
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
# Install pdepend
#

execute "PHP QA Tools - download source for 'pdepend'" do
  command "wget http://static.pdepend.org/php/latest/pdepend.phar"
  not_if do
    File.exists?("/var/log/if-pdepend-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - change source permission" do
  command "chmod +x pdepend.phar"
  not_if do
    File.exists?("/var/log/if-pdepend-installed")
  end
  user "root"
  action :run
end

execute "PHP QA Tools - move source '/usr/local/bin/pdepend'" do
  command "mv pdepend.phar /usr/local/bin/pdepend"
  not_if do
    File.exists?("/var/log/if-pdepend-installed")
  end
  user "root"
  action :run
end

#
# Set lock file to prevent repeat setup
#

execute "PHP QA Tools - set pdepend installation done lock file" do
  command "touch /var/log/if-pdepend-installed"
  not_if do
    File.exists?("/var/log/if-pdepend-installed")
  end
  user "root"
  action :run
end
