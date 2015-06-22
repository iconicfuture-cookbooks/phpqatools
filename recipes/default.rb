#
# Cookbook Name:: phpqatools
# Recipe:: default
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

# install pdepend
include_recipe "phpqatools::pdepend"

# install phpunit
include_recipe "phpqatools::phpunit"

# install phploc
include_recipe "phpqatools::phploc"

# install phpcpd
include_recipe "phpqatools::phpcpd"

# install phpmd
include_recipe "phpqatools::phpmd"

# install phpcs
include_recipe "phpqatools::phpcs"

# install phpDocumentor
include_recipe "phpqatools::phpdocumentor"
