# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Declare your gem's dependencies in taro_core.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

gem "bootsnap", ">= 1.1.0", require: false
gem "haml"
gem "pragmatic_segmenter"
gem "puma", "~> 3.11"
gem "yahoo-japanese-analysis"

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "guard-bundler"
  gem "guard-rails"
  gem "guard-rspec"
  gem "haml-rails", require: false
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rails-erd", require: false
  gem "rb-fchange", require: false
  gem "rb-fsevent", require: false
  gem "rb-inotify", require: false
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :development, :test do
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-rails"
  gem "pry-rescue"
  gem "rails_best_practices", require: false
  gem "reek",                 require: false
  gem "rspec-rails"
  gem "rubocop-github"
  gem "rubocop-rspec"
end

group :test do
  gem "database_cleaner"
  gem "rspec_junit_formatter"
  gem "shoulda-matchers", "~> 3.1"
  gem "simplecov", require: false
  gem "timecop"
end
