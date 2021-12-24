source 'https://rubygems.org'

gem 'rails', '~> 7.0.0'
gem 'sqlite3'
gem 'puma', '~> 4.0'

flipper_version = '~> 0.22.0'
flipper_version = {git: 'https://github.com/jnunemaker/flipper'}
gem 'flipper-cloud', flipper_version
gem 'flipper-active_record', flipper_version

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
