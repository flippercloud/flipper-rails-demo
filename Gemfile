source 'https://rubygems.org'

gem 'rails'
gem 'sqlite3'
gem 'puma'
gem 'bcrypt'
gem 'faker'

flipper_version = { git: "https://github.com/flippercloud/flipper", ref: "ef9a631858c582b53b6d0ab7bcc557e0c477a685" }
gem 'flipper-cloud', flipper_version
gem 'flipper-ui', flipper_version
gem 'flipper-active_record', flipper_version
gem 'ansi-to-html'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'dotenv-rails'
  gem 'selenium-webdriver'
  gem 'webmock'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end
