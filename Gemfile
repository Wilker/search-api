source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
# Use sqlite3 as the database for Active Record

gem 'mysql2'

# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'


gem 'jwt'
gem 'redis', '~> 4.2.1'
gem 'sidekiq', '~> 6.1.1'
gem "sidekiq-cron", "~> 1.1"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', '~> 0.92.0', require: false
  gem 'awesome_print'
  gem 'factory_bot_rails'
  gem 'letter_opener'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'faker', '~>2.14.0'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


group :test do
  gem 'webdrivers'
  gem 'database_cleaner'
  gem 'rspec-collection_matchers'
  gem 'rspec-html-matchers'
  gem 'rspec-rails', '~> 3.5'
  gem 'rspec-retry'
  gem 'rspec-sidekiq'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'vcr', '2.9.3'
  gem 'webmock'
  gem 'selenium-webdriver'
end