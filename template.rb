if yes?('Gemfile replace?')

remove_file "Gemfile"
file 'Gemfile', <<Gemfile
source 'https://rubygems.org/'

ruby "2.0.0"

gem "rails","4.0.0"

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development,:test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'rb-readline',"0.4.2"
  gem 'puma'
end

group :test do
  gem 'capybara'
end

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass'

Gemfile
else
  gem "rspec-rails"
end

run('bundle install --without production')

git :init
git add: '.'
git commit: "-m 'initial rails commit'"

generate 'rspec:install'

git add: '.'
git commit: "-m 'rspec install'"

