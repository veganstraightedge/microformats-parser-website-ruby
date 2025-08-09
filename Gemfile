source 'https://rubygems.org'

ruby file: '.ruby-version'

# app server
gem 'rails'

# database
gem 'pg'

# webserver
gem 'puma'

# webserver
gem 'microformats'

# assets
gem 'autoprefixer-rails'
gem 'bootstrap'
gem 'jquery-rails'
gem 'sass-rails'
gem 'uglifier'

# For codestyle guide and linting
gem 'rubocop', require: false
gem 'rubocop-rspec'

# dev and testing
group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_bot_rails'
  gem 'guard-rspec'
  gem 'nokogiri'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'simplecov', require: false
  gem 'spring-commands-rspec'
end

# dev
group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'

  # For measuring page/code performance
  gem 'rack-mini-profiler'

  # For memory profiling
  gem 'memory_profiler'

  # For call-stack profiling flamegraphs
  gem 'fast_stack'
  gem 'flamegraph'
  gem 'stackprof'
end

# windows dev
gem 'tzinfo-data', platforms: [:windows, :jruby]
