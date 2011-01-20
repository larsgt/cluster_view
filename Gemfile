source 'http://rubygems.org/'

gem 'rails',      '= 2.3.5'
gem 'haml',       '~> 2.2.3'
gem 'compass',    '~> 0.8.0'
gem 'formtastic', '~> 0.9.8'
gem 'authlogic',  '= 2.1.3'

# NOTE: using fork of the thoughtbot gem for :database storage module
gem 'paperclip', '~> 2.3.0', :git => 'http://github.com/patshaughnessy/paperclip.git'


# These two are only needed in the deployed environments, and in test
gem 'mysql',         '>= 2.8.1'
gem 'net-ldap',      '~> 0.1.1'

gem "cbrunnkvist-psd_logger"

group :development do
  gem 'sqlite3-ruby', '~> 1.2.0', :require => 'sqlite3'
end

group :test do
  gem 'test-unit',    '~> 1.2.3'
  gem 'rspec-rails',  '~> 1.3.2'
  gem 'factory_girl', '= 1.2.4'
  gem 'nokogiri'
  gem 'webrat'
  gem 'sqlite3-ruby', '~> 1.2.0', :require => 'sqlite3'
  gem 'ci_reporter'
end

group :cucumber do
  gem 'cucumber-rails',   '>= 0.3.0'
  gem 'database_cleaner', '>= 0.5.0'
  gem 'factory_girl',     '= 1.2.4'
  gem 'sqlite3-ruby',     '~> 1.2.0', :require => 'sqlite3'
end

group :deployment do
  gem 'thin'
end