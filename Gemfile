source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

gem 'bootsnap', '>= 1.2', require: false
gem 'rails', '~> 6.0.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'rack-cors', require: 'rack/cors'
gem 'rest-client'
gem 'devise_token_auth'
gem 'stripe-rails'
gem 'pundit'


group :development, :test do
  gem 'webmock'
  gem 'coveralls', require: false
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
  gem 'stripe-ruby-mock', '~> 2.5.6', require: 'stripe_mock'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end