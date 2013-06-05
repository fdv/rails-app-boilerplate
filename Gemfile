require 'yaml'
env = ENV["RAILS_ENV"] || 'development'
dbfile = File.expand_path("../config/database.yml", __FILE__)

unless File.exists?(dbfile)
  raise "You need to configure config/database.yml first"
else
  conf = YAML.load(File.read(dbfile))
  environment = conf[env]
  adapter = environment['adapter'] if environment
  raise "You need define an adapter in your database.yml or set your RAILS_ENV variable" if adapter == '' || adapter.nil?
  case adapter
  when 'sqlite3'
    gem 'sqlite3'
  when 'postgresql'
    gem 'pg'
  when 'mysql2'
    gem 'mysql2'
  else
    raise "Don't know what gem to use for adapter #{adapter}"
  end
end

source 'https://rubygems.org'

gem 'rails', '~> 3.2'
gem "twitter-bootstrap-rails"

group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

#user authentication
gem 'devise', '~> 2'

group :test, :development do
  gem 'thin'
end

group :test do
  gem 'rspec-rails', '~> 2'
  gem 'factory_girl', '~> 3'
  gem 'factory_girl_rails'
  gem 'webrat'

  #debugging
  gem "pry"
  gem "pry-debugger"
end

group :development do
  #show great looking error pages with extra functionality
  gem "better_errors"
  gem "binding_of_caller"

  #load rails much faster in development
  gem 'rails-dev-boost', git: 'git://github.com/thedarkone/rails-dev-boost.git'
end
