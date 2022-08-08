source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 5.2.8', '>= 5.2.8.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bcrypt', '~> 3.1.7'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'faraday'
gem 'figaro'
gem 'jsonapi-serializer'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker' 
  gem 'capybara'
  gem 'vcr'
  gem 'webmock'
  gem 'shoulda-matchers'
  gem 'simplecov'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # gem 'database_cleaner-active_record'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
