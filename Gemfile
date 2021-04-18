source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 6.1.3.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'faker'
  gem 'spring-commands-rspec'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'cuprite'
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

gem 'devise'
gem 'omniauth-google-oauth2' # Google認証

gem 'rename'

# for image uploader with AWS S3
gem 'fog'
gem "carrierwave" #画像アップロード

gem 'hirb'
gem 'hirb-unicode'

gem 'acts-as-taggable-on'

gem 'font-awesome-sass'

gem 'jquery-rails'

gem 'devise-i18n'
gem 'devise-bootstrap-views'

gem "bullet"

gem 'bootstrap'

# ExecJS::RuntimeUnavailable対応
gem 'mini_racer'

gem 'cancancan'

# Git Hub We found potential security vulnerabilities in your dependencies.の為
gem 'omniauth-rails_csrf_protection'

# 0.4.0以降でruby2.7.3以降だとエラーが出る為
gem 'mimemagic', '~> 0.3.0'

# 2.0,0以降だとエラーが出る為(RuntimeError: You are using an old OmniAuth version, please ensure you have 1.0.0.pr2 version or later installed.)
gem 'omniauth', '1.9.1'