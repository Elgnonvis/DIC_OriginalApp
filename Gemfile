source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }


# Core
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails', '5.2.5'
# gem 'rake', '~> 13.0', '>= 13.0.6'
# ruby '2.6.5'


#Administration & Authentication
# gem 'bcrypt', '~> 3.1.7'
gem 'devise', '~> 4.8'
gem 'rails_admin'
gem 'devise-i18n'
gem 'devise-bootstrap-views', '~> 1.1'
gem 'cancancan', '~> 3.3'
gem 'mail_form', '~> 1.9'
gem 'faker'


#Image..
gem 'cloudinary', '~> 1.21'
gem 'mini_magick', '~> 4.8'
gem 'carrierwave', '~> 2.0'

# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
# gem 'unicorn'

# Frontend
gem 'kaminari'
gem 'bootstrap4-kaminari-views'
gem 'simple_form', '~> 5.1'
gem 'bootstrap', '~> 5.1.0'
gem 'jquery-rails', '~> 4.4'
gem "font-awesome-rails"
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'

# Backend
gem 'jbuilder', '~> 2.5'

#Internationalization
# gem 'i18n'

gem 'date_validator'

gem 'rexml'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'spring'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
end

group :development do
 gem 'web-console', '>= 3.3.0'
 gem 'listen', '>= 3.0.5', '< 3.2'
 gem 'letter_opener_web'
 gem 'devise-specs'
#  gem 'spring'
 gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
end

group :doc do
  # gem 'sdoc', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]