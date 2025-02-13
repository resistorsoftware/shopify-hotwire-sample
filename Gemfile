source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

# backend
gem "rails", "~> 7.0"
gem "pg", "~> 1.1"
gem "redis"
gem "puma", "~> 5.0"
gem "bootsnap", ">= 1.9.3", require: false
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "dotenv-rails", "~> 2.7"
gem "sidekiq"

# shopify
gem "shopify_app"
gem "polaris_view_components", "~> 0.9.0"

# frontend
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "sprockets-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "foreman", "~> 0.87.2"
  gem "puma-ngrok-tunnel"
  gem "standard"
  gem "hotwire-livereload"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end
