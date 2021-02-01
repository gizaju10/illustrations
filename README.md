[![gizaju10](https://circleci.com/gh/gizaju10/illustrations.svg?style=svg)](https://circleci.com/gh/gizaju10/illustrations)


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Sprockets::Rails::Helper::AssetNotPrecompiled in~
↓
config/initializers/assets.rb
Rails.application.config.assets.precompile += %w( application.css )
↓
$rake assets:precompile