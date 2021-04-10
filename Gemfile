source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.5'
# gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  # gem 'factory_girl_rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'faker'
  gem 'spring-commands-rspec'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-watcher-listen'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  # gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  # "webdrivers"ではなく、"selenium-webdriver"を使用
  # gem 'webdrivers'
  # gem 'webdrivers', require: !ENV['SELENIUM_DRIVER_URL']
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'tzinfo-data'

# 追加 エラーメッセージの日本語化
gem 'rails-i18n'

# パスワード暗号化
gem 'bcrypt'

# .envの利用
gem 'dotenv-rails'

# ページネーション
gem 'kaminari'

gem 'google-api-client'

gem 'devise', '~> 4.7', '>= 4.7.3'

# gem 'omniauth-facebook'                  # Facebook認証
# gem 'omniauth-twitter'                   # Twitter認証
gem 'omniauth-google-oauth2'             # Google認証
# gem 'omniauth-line'                      # LINE認証

gem 'rename'

# for image uploader with AWS S3
gem 'fog'
# gem 'carrierwave' #画像アップロード

gem 'rmagick' #画像の加工

gem 'hirb'
gem 'hirb-unicode'

gem 'acts-as-taggable-on', '~> 6.0'

# gem 'font-awesome-rails'
gem 'font-awesome-sass'

gem 'jquery-rails'

gem 'devise-i18n'
gem 'devise-bootstrap-views'

gem "bullet"

# gem 'rspec-rails'

# gem 'factory_bot_rails'

gem 'bootstrap'

# ExecJS::RuntimeUnavailable対応
gem 'mini_racer'

gem 'cancancan'

# Git Hub We found potential security vulnerabilities in your dependencies.
# gem "activerecord", ">= 6.0.3.5"
# gem "actionpack", ">= 6.0.3.5"
gem "carrierwave", ">= 2.1.1"
# gem "omniauth"
gem 'omniauth-rails_csrf_protection'
# gem "nokogiri", ">= 1.11.0"
