source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'
gem 'rails', '~> 6.0.3'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave'
gem 'mini_magick'
gem 'rexml'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
