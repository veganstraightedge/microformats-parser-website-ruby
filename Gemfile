source 'https://rubygems.org'

ruby file: '.ruby-version'

# app server
gem 'rails'

# database
gem 'pg'

# webserver
gem 'puma'

# parser
gem 'microformats'

# dev and testing
group :development, :test do
  gem 'brakeman', require: false
  gem 'erb_lint', require: false
  gem 'capybara'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'selenium-webdriver'

  # For codestyle guide and linting
  gem 'rubocop',             require: false
  gem 'rubocop-capybara',    require: false
  gem 'rubocop-rails',       require: false
  gem 'rubocop-rspec',       require: false
  gem 'rubocop-rspec_rails', require: false
end

# windows dev
gem 'tzinfo-data', platforms: %i[windows jruby]
