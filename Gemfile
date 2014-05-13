source 'https://rubygems.org'

gem 'active_model_serializers'
gem 'pg'
gem 'rails', '4.1.1'


group :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

group :production, :development do
  gem 'puma'
  gem 'redis-rails'
end

group :development do
  gem 'pry'
  gem 'swagger-docs'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

