# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'
gem 'cancancan', '~> 2.0' # for authorization
gem 'ckeditor'
gem 'coffee-rails', '~> 4.2'
gem 'devise' # for authentication
gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master' # for factory field generations
gem 'haml-rails', '~> 1.0' # ease of use of haml in project
gem 'humanize'
gem 'jbuilder', '~> 2.5'
gem 'materialize-sass', '~> 1.0.0.rc2' # my favorite css framework lol
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.6'
gem 'rails_admin', '~> 1.3'
gem 'rails_admin_rollincode', '~> 1.0' # trusty flat theme for rails_admin
gem 'rubocop', require: false # my favorite linter to keep my code strict to community guidelines and practices
gem 'sanitize' # relied on a third party gem for sanitizing html for easier config
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'mocha'
  gem 'shoulda-matchers', '~> 3.1'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
