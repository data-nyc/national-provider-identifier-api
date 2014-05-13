source 'https://rubygems.org'

gem 'active_model_serializers'
gem 'pg'
gem 'rails', '4.1.1'

gem 'rspec-rails', group: [:development, :test]

gem :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

gem :production, :development do
  gem 'puma'
  gem 'redis'
  gem 'redis-rails'
end

gem :development do
  gem 'pry'
  gem 'swagger-docs'
end

gem :development, :test do
  gem 'shoulda-matchers'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

