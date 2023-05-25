source 'https://rubygems.org'

gem 'rails', '~> 7.0.4.3'
gem 'sqlite3'
gem 'puma'
gem 'bcrypt'

flipper_version = '~> 0.28.0' # Latest as of 2023-04-07
gem 'flipper-cloud', flipper_version
gem 'flipper-ui', flipper_version
gem 'flipper-active_record', flipper_version

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end
