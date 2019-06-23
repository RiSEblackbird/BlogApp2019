source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'
gem 'bootstrap', '4.3.1'
gem 'sprockets', '3.7.2'
gem 'jquery-rails'
gem "font-awesome-sass"
gem 'devise', '4.6.2'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'cancancan'
gem 'rails_admin'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'mini_magick'
gem 'carrierwave'
gem "better_errors"
gem "binding_of_caller"
gem 'activesupport'
gem 'rails', '~> 5.2.3'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 4.11'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '0.20.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'rspec-rails', '~> 3.7'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
