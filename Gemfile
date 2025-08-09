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
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'

  # For codestyle guide and linting
  gem 'rubocop',             require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-rails',       require: false
  gem 'rubocop-rspec',       require: false
  gem 'rubocop-rspec_rails', require: false
end

# windows dev
gem 'tzinfo-data', platforms: [:windows, :jruby]
