source 'https://rubygems.org'
ruby '2.3.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.7', '>= 5.0.7.1'
# AASM for state machines
gem 'aasm', '~> 5.0', '>= 5.0.1'
# Add a comment with the structure that the model/table has
gem 'annotate', '~> 2.7', '>= 2.7.4'
# It is a gem that allows us to edit the fields without having to move from place.
gem 'best_in_place', '~> 3.1', '>= 3.1.1'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Authentication
gem 'devise', '~> 4.5'
# It's a decorator that can wrap your models with presentation-related logic 
gem 'draper', '~> 3.0', '>= 3.0.1'
# grid - view
gem 'flexbox_rb', '~> 0.5'
# views 
gem 'haml-rails', '~> 1.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# login/authentication with facebook
gem 'omniauth-facebook', '~> 5.0'
# library to attach files
gem 'paperclip', '~> 6.1'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.3', '>= 3.3.5'
# This gem enabling asynchronous file uploads via Ajax
gem 'remotipart', '~> 1.4', '>= 1.4.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Sidekiq for jobs in the background
gem 'sidekiq', '~> 5.2', '>= 5.2.5'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# for performing paginated queries 
gem 'will_paginate', '~> 3.1', '>= 3.1.6'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # console
  gem 'awesome_print', '~> 1.8'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # configuration of local environment variables
  gem 'dotenv-rails', '~> 2.5'
  # It allows to create objects of the BD for tests
  gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
  # Fake data
  gem 'faker', '~> 1.9', '>= 1.9.3'
  # debug
  gem 'pry-nav', '~> 0.2.4'
  gem 'pry-rails', '~> 0.3.8'
  # Test frameworks
  gem 'rspec-rails', '~> 3.8', '>= 3.8.1'
  # Specific help methods for Rails validations
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end
